; DESCRIPTION: Renders a red line between points (231, 14) and (223, 150).
; PLAN: r0=231(x1), r1=14(y1), r2=223(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 14
LDI r2, 223
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
