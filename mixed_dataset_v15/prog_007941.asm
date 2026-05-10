; DESCRIPTION: Renders a cyan line segment connecting (153, 118) to (398, 124).
; PLAN: r0=153(x1), r1=118(y1), r2=398(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 118
LDI r2, 398
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
