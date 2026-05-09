; DESCRIPTION: Composite: . Then Places a orange circle of radius 55 at center (172, 82). Then Renders a black line between points (248, 98) and (23, 44).
; PLAN: r0=172(x), r1=82(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x1), r1=98(y1), r2=23(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 55 at center (172, 82).
; PLAN: r0=172(x), r1=82(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 82
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (248, 98) and (23, 44).
; PLAN: r0=248(x1), r1=98(y1), r2=23(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 98
LDI r2, 23
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
