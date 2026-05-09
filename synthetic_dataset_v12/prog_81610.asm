; DESCRIPTION: Draws a blue rectangle at (302, 211) with width 18 and height 27.
; PLAN: r0=302(x), r1=211(y), r2=18(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 211
LDI r2, 18
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
