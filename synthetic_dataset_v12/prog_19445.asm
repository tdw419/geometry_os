; DESCRIPTION: Renders a black line between points (500, 61) and (445, 63).
; PLAN: r0=500(x1), r1=61(y1), r2=445(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 61
LDI r2, 445
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
