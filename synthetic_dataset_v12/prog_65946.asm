; DESCRIPTION: Renders a green line between points (180, 223) and (10, 97).
; PLAN: r0=180(x1), r1=223(y1), r2=10(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 223
LDI r2, 10
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
