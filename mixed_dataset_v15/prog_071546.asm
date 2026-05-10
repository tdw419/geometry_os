; DESCRIPTION: Renders a magenta rectangular region spanning 114 by 107 at (400, 192).
; PLAN: r0=400(x), r1=192(y), r2=114(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 192
LDI r2, 114
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
