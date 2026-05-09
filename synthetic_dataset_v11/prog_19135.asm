; DESCRIPTION: Renders a white line between points (65, 135) and (160, 105).
; PLAN: r0=65(x1), r1=135(y1), r2=160(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 135
LDI r2, 160
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
