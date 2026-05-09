; DESCRIPTION: Composite: . Then Renders a orange line between points (62, 147) and (210, 95). Then Sets a single black pixel at (107, 203).
; PLAN: r0=62(x1), r1=147(y1), r2=210(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (62, 147) and (210, 95).
; PLAN: r0=62(x1), r1=147(y1), r2=210(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 147
LDI r2, 210
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (107, 203).
; PLAN: r0=107(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
HALT
