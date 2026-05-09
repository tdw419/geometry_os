; DESCRIPTION: Renders a green box of size 92x38 starting at (269, 147).
; PLAN: r0=269(x), r1=147(y), r2=92(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 147
LDI r2, 92
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
