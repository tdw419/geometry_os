; DESCRIPTION: Renders a black line between points (503, 13) and (0, 187).
; PLAN: r0=503(x1), r1=13(y1), r2=0(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 13
LDI r2, 0
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
