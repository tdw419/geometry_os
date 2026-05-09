; DESCRIPTION: Renders a black line between points (135, 25) and (126, 223).
; PLAN: r0=135(x1), r1=25(y1), r2=126(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 25
LDI r2, 126
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
