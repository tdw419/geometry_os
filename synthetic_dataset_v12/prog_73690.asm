; DESCRIPTION: Renders a blue line between points (175, 109) and (394, 65).
; PLAN: r0=175(x1), r1=109(y1), r2=394(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 109
LDI r2, 394
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
