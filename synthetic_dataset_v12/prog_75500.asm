; DESCRIPTION: Draws a red rectangle at (102, 95) with width 111 and height 51.
; PLAN: r0=102(x), r1=95(y), r2=111(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 95
LDI r2, 111
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
