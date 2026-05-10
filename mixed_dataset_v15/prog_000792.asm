; DESCRIPTION: Draws a red rectangle at (92, 74) with width 22 and height 73.
; PLAN: r0=92(x), r1=74(y), r2=22(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 74
LDI r2, 22
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
