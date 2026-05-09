; DESCRIPTION: Renders a green line between points (420, 20) and (372, 122).
; PLAN: r0=420(x1), r1=20(y1), r2=372(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 20
LDI r2, 372
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
