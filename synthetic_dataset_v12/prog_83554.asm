; DESCRIPTION: Renders a white line between points (191, 240) and (57, 188).
; PLAN: r0=191(x1), r1=240(y1), r2=57(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 240
LDI r2, 57
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
