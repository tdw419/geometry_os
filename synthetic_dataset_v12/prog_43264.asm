; DESCRIPTION: Renders a orange line between points (385, 71) and (23, 215).
; PLAN: r0=385(x1), r1=71(y1), r2=23(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 71
LDI r2, 23
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
