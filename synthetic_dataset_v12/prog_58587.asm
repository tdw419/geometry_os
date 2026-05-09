; DESCRIPTION: Places a white line segment connecting (92, 19) to (302, 103).
; PLAN: r0=92(x1), r1=19(y1), r2=302(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 19
LDI r2, 302
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
