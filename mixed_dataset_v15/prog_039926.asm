; DESCRIPTION: Places a cyan 10x91 rectangle at position (132, 24).
; PLAN: r0=132(x), r1=24(y), r2=10(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 24
LDI r2, 10
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
