; DESCRIPTION: Draws a green rectangle at (92, 136) with width 82 and height 59.
; PLAN: r0=92(x), r1=136(y), r2=82(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 136
LDI r2, 82
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
