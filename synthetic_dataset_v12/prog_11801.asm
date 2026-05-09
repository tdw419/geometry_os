; DESCRIPTION: Draws a red rectangle at (121, 140) with width 111 and height 34.
; PLAN: r0=121(x), r1=140(y), r2=111(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 140
LDI r2, 111
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
