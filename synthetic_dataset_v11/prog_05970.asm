; DESCRIPTION: Renders a cyan line between points (238, 145) and (145, 9).
; PLAN: r0=238(x1), r1=145(y1), r2=145(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 145
LDI r2, 145
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
