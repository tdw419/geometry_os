; DESCRIPTION: Draws a green rectangle at (271, 71) with width 84 and height 92.
; PLAN: r0=271(x), r1=71(y), r2=84(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 71
LDI r2, 84
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
