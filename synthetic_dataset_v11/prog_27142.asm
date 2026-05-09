; DESCRIPTION: Renders a white line between points (193, 222) and (125, 175).
; PLAN: r0=193(x1), r1=222(y1), r2=125(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 222
LDI r2, 125
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
