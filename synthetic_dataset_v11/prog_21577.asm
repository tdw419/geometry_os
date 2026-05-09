; DESCRIPTION: Renders a green line between points (36, 50) and (112, 126).
; PLAN: r0=36(x1), r1=50(y1), r2=112(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 50
LDI r2, 112
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
