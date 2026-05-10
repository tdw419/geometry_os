; DESCRIPTION: Draws a green rectangle at (2, 180) with width 92 and height 46.
; PLAN: r0=2(x), r1=180(y), r2=92(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 180
LDI r2, 92
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
