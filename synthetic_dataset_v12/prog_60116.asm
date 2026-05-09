; DESCRIPTION: Renders a white line between points (313, 114) and (435, 133).
; PLAN: r0=313(x1), r1=114(y1), r2=435(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 114
LDI r2, 435
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
