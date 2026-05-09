; DESCRIPTION: Renders a white line between points (175, 238) and (435, 33).
; PLAN: r0=175(x1), r1=238(y1), r2=435(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 238
LDI r2, 435
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
