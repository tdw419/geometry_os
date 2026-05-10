; DESCRIPTION: Renders a white line between points (1, 38) and (310, 220).
; PLAN: r0=1(x1), r1=38(y1), r2=310(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 38
LDI r2, 310
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
