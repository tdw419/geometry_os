; DESCRIPTION: Renders a black line between points (126, 248) and (332, 193).
; PLAN: r0=126(x1), r1=248(y1), r2=332(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 248
LDI r2, 332
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
