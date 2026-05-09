; DESCRIPTION: Renders a white line between points (175, 83) and (237, 95).
; PLAN: r0=175(x1), r1=83(y1), r2=237(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 83
LDI r2, 237
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
