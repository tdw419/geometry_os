; DESCRIPTION: Places a white line segment connecting (278, 40) to (117, 209).
; PLAN: r0=278(x1), r1=40(y1), r2=117(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 40
LDI r2, 117
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
