; DESCRIPTION: Draws a blue rectangle at (269, 92) with width 98 and height 36.
; PLAN: r0=269(x), r1=92(y), r2=98(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 92
LDI r2, 98
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
