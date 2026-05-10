; DESCRIPTION: Renders a cyan line between points (459, 46) and (453, 216).
; PLAN: r0=459(x1), r1=46(y1), r2=453(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 46
LDI r2, 453
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
