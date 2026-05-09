; DESCRIPTION: Renders a white line between points (237, 141) and (32, 145).
; PLAN: r0=237(x1), r1=141(y1), r2=32(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 141
LDI r2, 32
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
