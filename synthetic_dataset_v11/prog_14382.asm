; DESCRIPTION: Draws a cyan rectangle at (180, 69) with width 22 and height 20.
; PLAN: r0=180(x), r1=69(y), r2=22(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 69
LDI r2, 22
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
