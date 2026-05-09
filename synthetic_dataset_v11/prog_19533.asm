; DESCRIPTION: Renders a white line between points (138, 152) and (3, 198).
; PLAN: r0=138(x1), r1=152(y1), r2=3(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 152
LDI r2, 3
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
