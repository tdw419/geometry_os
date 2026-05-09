; DESCRIPTION: Renders a white line between points (83, 160) and (214, 28).
; PLAN: r0=83(x1), r1=160(y1), r2=214(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 160
LDI r2, 214
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
