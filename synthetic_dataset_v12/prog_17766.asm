; DESCRIPTION: Places a white line segment connecting (165, 204) to (92, 65).
; PLAN: r0=165(x1), r1=204(y1), r2=92(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 204
LDI r2, 92
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
