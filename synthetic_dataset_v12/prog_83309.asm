; DESCRIPTION: Renders a red box of size 64x107 starting at (221, 147).
; PLAN: r0=221(x), r1=147(y), r2=64(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 147
LDI r2, 64
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
