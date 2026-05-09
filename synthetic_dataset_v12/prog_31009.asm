; DESCRIPTION: Renders a orange line between points (488, 160) and (277, 63).
; PLAN: r0=488(x1), r1=160(y1), r2=277(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 160
LDI r2, 277
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
