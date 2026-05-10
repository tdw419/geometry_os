; DESCRIPTION: Renders a red rectangular region spanning 28 by 75 at (335, 183).
; PLAN: r0=335(x), r1=183(y), r2=28(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 183
LDI r2, 28
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
