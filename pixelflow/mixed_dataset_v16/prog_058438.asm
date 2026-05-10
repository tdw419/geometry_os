; DESCRIPTION: Renders a white line between points (388, 20) and (196, 188).
; PLAN: r0=388(x1), r1=20(y1), r2=196(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 20
LDI r2, 196
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
