; DESCRIPTION: Renders a white line between points (150, 84) and (24, 40).
; PLAN: r0=150(x1), r1=84(y1), r2=24(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 84
LDI r2, 24
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
