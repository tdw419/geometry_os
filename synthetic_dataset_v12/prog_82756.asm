; DESCRIPTION: Renders a white line between points (243, 112) and (490, 190).
; PLAN: r0=243(x1), r1=112(y1), r2=490(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 112
LDI r2, 490
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
