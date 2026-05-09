; DESCRIPTION: Composite: . Then Renders a green disk with center (229, 85) and radius 21. Then Renders a magenta line between points (122, 203) and (147, 41).
; PLAN: r0=229(x), r1=85(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x1), r1=203(y1), r2=147(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (229, 85) and radius 21.
; PLAN: r0=229(x), r1=85(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 85
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (122, 203) and (147, 41).
; PLAN: r0=122(x1), r1=203(y1), r2=147(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 203
LDI r2, 147
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
