; DESCRIPTION: Places a white line segment connecting (259, 127) to (264, 240).
; PLAN: r0=259(x1), r1=127(y1), r2=264(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 127
LDI r2, 264
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
