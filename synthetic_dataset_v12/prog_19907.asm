; DESCRIPTION: Renders a white line between points (152, 160) and (114, 1).
; PLAN: r0=152(x1), r1=160(y1), r2=114(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 160
LDI r2, 114
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
