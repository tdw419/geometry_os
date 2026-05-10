; DESCRIPTION: Renders a black line between points (350, 187) and (429, 31).
; PLAN: r0=350(x1), r1=187(y1), r2=429(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 187
LDI r2, 429
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
