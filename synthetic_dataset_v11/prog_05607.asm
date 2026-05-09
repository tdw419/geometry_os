; DESCRIPTION: Renders a red box of size 75x112 starting at (147, 40).
; PLAN: r0=147(x), r1=40(y), r2=75(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 40
LDI r2, 75
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
