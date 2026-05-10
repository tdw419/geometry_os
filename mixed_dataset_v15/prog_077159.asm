; DESCRIPTION: Renders a red line between points (260, 132) and (50, 152).
; PLAN: r0=260(x1), r1=132(y1), r2=50(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 132
LDI r2, 50
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
