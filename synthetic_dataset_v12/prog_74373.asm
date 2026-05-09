; DESCRIPTION: Renders a black line between points (349, 253) and (450, 120).
; PLAN: r0=349(x1), r1=253(y1), r2=450(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 253
LDI r2, 450
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
