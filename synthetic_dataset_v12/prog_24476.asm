; DESCRIPTION: Renders a white line between points (223, 152) and (250, 33).
; PLAN: r0=223(x1), r1=152(y1), r2=250(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 152
LDI r2, 250
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
