; DESCRIPTION: Renders a cyan line between points (269, 110) and (100, 112).
; PLAN: r0=269(x1), r1=110(y1), r2=100(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 110
LDI r2, 100
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
