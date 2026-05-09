; DESCRIPTION: Renders a black line between points (147, 94) and (193, 228).
; PLAN: r0=147(x1), r1=94(y1), r2=193(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 94
LDI r2, 193
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
