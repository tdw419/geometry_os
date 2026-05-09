; DESCRIPTION: Renders a orange line between points (294, 110) and (328, 177).
; PLAN: r0=294(x1), r1=110(y1), r2=328(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 110
LDI r2, 328
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
