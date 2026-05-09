; DESCRIPTION: Renders a red line between points (225, 173) and (132, 110).
; PLAN: r0=225(x1), r1=173(y1), r2=132(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 173
LDI r2, 132
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
