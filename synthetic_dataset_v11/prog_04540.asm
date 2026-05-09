; DESCRIPTION: Composite: . Then Sets a single black pixel at (253, 126). Then Renders a orange line between points (184, 217) and (133, 59).
; PLAN: r0=253(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=184(x1), r1=217(y1), r2=133(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (253, 126).
; PLAN: r0=253(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (184, 217) and (133, 59).
; PLAN: r0=184(x1), r1=217(y1), r2=133(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 217
LDI r2, 133
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
