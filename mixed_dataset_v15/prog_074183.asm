; DESCRIPTION: Renders a yellow box of size 109x85 starting at (323, 65).
; PLAN: r0=323(x), r1=65(y), r2=109(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 65
LDI r2, 109
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
