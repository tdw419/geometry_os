; DESCRIPTION: Renders a black line between points (107, 25) and (87, 150).
; PLAN: r0=107(x1), r1=25(y1), r2=87(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 25
LDI r2, 87
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
