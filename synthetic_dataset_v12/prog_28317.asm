; DESCRIPTION: Renders a red box of size 58x12 starting at (71, 147).
; PLAN: r0=71(x), r1=147(y), r2=58(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 147
LDI r2, 58
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
