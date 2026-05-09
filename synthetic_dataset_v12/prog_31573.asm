; DESCRIPTION: Renders a black line between points (98, 120) and (229, 209).
; PLAN: r0=98(x1), r1=120(y1), r2=229(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 120
LDI r2, 229
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
