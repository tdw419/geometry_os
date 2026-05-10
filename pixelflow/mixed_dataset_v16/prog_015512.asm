; DESCRIPTION: Draws a cyan rectangle at (196, 13) with width 106 and height 85.
; PLAN: r0=196(x), r1=13(y), r2=106(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 13
LDI r2, 106
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
