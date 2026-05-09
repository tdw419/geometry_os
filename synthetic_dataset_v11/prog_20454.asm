; DESCRIPTION: Draws a green rectangle at (96, 205) with width 33 and height 45.
; PLAN: r0=96(x), r1=205(y), r2=33(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 205
LDI r2, 33
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
