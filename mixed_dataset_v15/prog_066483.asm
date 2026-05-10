; DESCRIPTION: Places a cyan 25x96 rectangle at position (37, 9).
; PLAN: r0=37(x), r1=9(y), r2=25(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 9
LDI r2, 25
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
