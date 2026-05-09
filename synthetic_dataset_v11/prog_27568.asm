; DESCRIPTION: Renders a white line between points (110, 166) and (151, 243).
; PLAN: r0=110(x1), r1=166(y1), r2=151(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 166
LDI r2, 151
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
