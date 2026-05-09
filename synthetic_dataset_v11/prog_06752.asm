; DESCRIPTION: Composite: . Then Renders a black line between points (184, 70) and (4, 176). Then Sets a single orange pixel at (1, 253).
; PLAN: r0=184(x1), r1=70(y1), r2=4(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=1(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (184, 70) and (4, 176).
; PLAN: r0=184(x1), r1=70(y1), r2=4(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 70
LDI r2, 4
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (1, 253).
; PLAN: r0=1(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
