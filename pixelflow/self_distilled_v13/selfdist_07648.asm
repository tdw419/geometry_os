; DESCRIPTION: Draws a green rectangle at (340, 47) with width 51 and height 69.
; PLAN: r0=340(x), r1=47(y), r2=51(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 47
LDI r2, 51
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
