; DESCRIPTION: Renders a white line between points (135, 112) and (350, 220).
; PLAN: r0=135(x1), r1=112(y1), r2=350(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 112
LDI r2, 350
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
