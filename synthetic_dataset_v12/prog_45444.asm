; DESCRIPTION: Renders a white line between points (24, 126) and (385, 152).
; PLAN: r0=24(x1), r1=126(y1), r2=385(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 126
LDI r2, 385
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
