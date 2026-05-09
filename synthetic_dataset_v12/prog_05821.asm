; DESCRIPTION: Renders a orange line between points (103, 124) and (362, 40).
; PLAN: r0=103(x1), r1=124(y1), r2=362(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 124
LDI r2, 362
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
