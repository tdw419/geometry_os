; DESCRIPTION: Draws a blue rectangle at (290, 183) with width 46 and height 25.
; PLAN: r0=290(x), r1=183(y), r2=46(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 183
LDI r2, 46
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
