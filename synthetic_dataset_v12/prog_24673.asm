; DESCRIPTION: Renders a black line between points (33, 57) and (261, 220).
; PLAN: r0=33(x1), r1=57(y1), r2=261(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 57
LDI r2, 261
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
