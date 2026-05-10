; DESCRIPTION: Draws a black rectangle at (180, 47) with width 111 and height 92.
; PLAN: r0=180(x), r1=47(y), r2=111(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 47
LDI r2, 111
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
