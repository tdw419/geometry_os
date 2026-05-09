; DESCRIPTION: Draws a cyan rectangle at (135, 188) with width 85 and height 18.
; PLAN: r0=135(x), r1=188(y), r2=85(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 188
LDI r2, 85
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
