; DESCRIPTION: Renders a magenta rectangular region spanning 74 by 98 at (291, 121).
; PLAN: r0=291(x), r1=121(y), r2=74(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 121
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
