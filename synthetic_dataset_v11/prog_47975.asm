; DESCRIPTION: Renders a green box of size 113x14 starting at (83, 147).
; PLAN: r0=83(x), r1=147(y), r2=113(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 147
LDI r2, 113
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
