; DESCRIPTION: Renders a green box of size 91x90 starting at (147, 14).
; PLAN: r0=147(x), r1=14(y), r2=91(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 14
LDI r2, 91
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
