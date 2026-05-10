; DESCRIPTION: Renders a cyan line segment connecting (162, 51) to (315, 29).
; PLAN: r0=162(x1), r1=51(y1), r2=315(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 51
LDI r2, 315
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
