; DESCRIPTION: Renders a cyan line between points (73, 47) and (250, 162).
; PLAN: r0=73(x1), r1=47(y1), r2=250(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 47
LDI r2, 250
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
