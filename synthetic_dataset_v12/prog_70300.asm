; DESCRIPTION: Renders a white line between points (372, 185) and (48, 150).
; PLAN: r0=372(x1), r1=185(y1), r2=48(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 185
LDI r2, 48
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
