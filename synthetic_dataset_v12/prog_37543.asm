; DESCRIPTION: Renders a black line between points (500, 129) and (13, 103).
; PLAN: r0=500(x1), r1=129(y1), r2=13(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 129
LDI r2, 13
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
