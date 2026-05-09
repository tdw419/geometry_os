; DESCRIPTION: Renders a cyan line between points (490, 114) and (105, 119).
; PLAN: r0=490(x1), r1=114(y1), r2=105(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 114
LDI r2, 105
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
