; DESCRIPTION: Renders a red line between points (278, 98) and (63, 84).
; PLAN: r0=278(x1), r1=98(y1), r2=63(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 98
LDI r2, 63
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
