; DESCRIPTION: Draws a cyan rectangle at (13, 25) with width 87 and height 49.
; PLAN: r0=13(x), r1=25(y), r2=87(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 25
LDI r2, 87
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
