; DESCRIPTION: Places a cyan 80x12 rectangle at position (63, 21).
; PLAN: r0=63(x), r1=21(y), r2=80(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 21
LDI r2, 80
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
