; DESCRIPTION: Renders a magenta rectangular region spanning 60 by 69 at (230, 54).
; PLAN: r0=230(x), r1=54(y), r2=60(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 54
LDI r2, 60
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
