; DESCRIPTION: Renders a black line between points (347, 228) and (107, 94).
; PLAN: r0=347(x1), r1=228(y1), r2=107(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 228
LDI r2, 107
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
