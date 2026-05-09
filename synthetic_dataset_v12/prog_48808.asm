; DESCRIPTION: Places a white line segment connecting (278, 166) to (95, 92).
; PLAN: r0=278(x1), r1=166(y1), r2=95(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 166
LDI r2, 95
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
