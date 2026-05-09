; DESCRIPTION: Renders a white line between points (29, 72) and (3, 63).
; PLAN: r0=29(x1), r1=72(y1), r2=3(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 72
LDI r2, 3
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
