; DESCRIPTION: Renders a white line between points (84, 21) and (103, 244).
; PLAN: r0=84(x1), r1=21(y1), r2=103(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 21
LDI r2, 103
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
