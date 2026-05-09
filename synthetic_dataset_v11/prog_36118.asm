; DESCRIPTION: Places a cyan 66x10 rectangle at position (26, 86).
; PLAN: r0=26(x), r1=86(y), r2=66(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 86
LDI r2, 66
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
