; DESCRIPTION: Renders a black line between points (220, 120) and (58, 132).
; PLAN: r0=220(x1), r1=120(y1), r2=58(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 120
LDI r2, 58
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
