; DESCRIPTION: Renders a white line between points (63, 89) and (239, 99).
; PLAN: r0=63(x1), r1=89(y1), r2=239(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 89
LDI r2, 239
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
