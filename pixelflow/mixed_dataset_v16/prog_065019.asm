; DESCRIPTION: Renders a yellow rectangular region spanning 57 by 113 at (335, 167).
; PLAN: r0=335(x), r1=167(y), r2=57(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 167
LDI r2, 57
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
