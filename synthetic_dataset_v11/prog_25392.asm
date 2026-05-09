; DESCRIPTION: Renders a cyan line between points (75, 58) and (112, 175).
; PLAN: r0=75(x1), r1=58(y1), r2=112(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 58
LDI r2, 112
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
