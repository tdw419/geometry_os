; DESCRIPTION: Renders a white line segment connecting (59, 181) to (362, 23).
; PLAN: r0=59(x1), r1=181(y1), r2=362(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 181
LDI r2, 362
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
