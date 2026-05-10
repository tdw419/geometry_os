; DESCRIPTION: Renders a white line between points (380, 136) and (299, 63).
; PLAN: r0=380(x1), r1=136(y1), r2=299(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 136
LDI r2, 299
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
