; DESCRIPTION: Draws a red rectangle at (137, 61) with width 112 and height 111.
; PLAN: r0=137(x), r1=61(y), r2=112(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 61
LDI r2, 112
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
