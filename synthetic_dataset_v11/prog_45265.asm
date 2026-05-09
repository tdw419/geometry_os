; DESCRIPTION: Places a purple line segment connecting (202, 43) to (217, 16).
; PLAN: r0=202(x1), r1=43(y1), r2=217(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 43
LDI r2, 217
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
