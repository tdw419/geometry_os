; DESCRIPTION: Renders a red box of size 63x60 starting at (336, 147).
; PLAN: r0=336(x), r1=147(y), r2=63(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 147
LDI r2, 63
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
