; DESCRIPTION: Renders a cyan line between points (80, 194) and (22, 51).
; PLAN: r0=80(x1), r1=194(y1), r2=22(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 194
LDI r2, 22
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
