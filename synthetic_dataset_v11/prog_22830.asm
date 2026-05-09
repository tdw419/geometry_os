; DESCRIPTION: Renders a cyan line between points (145, 247) and (110, 20).
; PLAN: r0=145(x1), r1=247(y1), r2=110(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 247
LDI r2, 110
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
