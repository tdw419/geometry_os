; DESCRIPTION: Renders a red rectangular region spanning 28 by 61 at (351, 129).
; PLAN: r0=351(x), r1=129(y), r2=28(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 129
LDI r2, 28
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
