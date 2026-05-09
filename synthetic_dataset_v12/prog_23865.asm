; DESCRIPTION: Renders a white line between points (39, 250) and (196, 34).
; PLAN: r0=39(x1), r1=250(y1), r2=196(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 250
LDI r2, 196
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
