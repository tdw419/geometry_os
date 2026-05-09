; DESCRIPTION: Renders a black line between points (82, 229) and (400, 86).
; PLAN: r0=82(x1), r1=229(y1), r2=400(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 229
LDI r2, 400
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
