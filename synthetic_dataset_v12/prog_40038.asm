; DESCRIPTION: Draws a black rectangle at (255, 95) with width 51 and height 48.
; PLAN: r0=255(x), r1=95(y), r2=51(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 95
LDI r2, 51
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
