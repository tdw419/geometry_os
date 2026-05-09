; DESCRIPTION: Renders a white line between points (132, 157) and (436, 29).
; PLAN: r0=132(x1), r1=157(y1), r2=436(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 157
LDI r2, 436
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
