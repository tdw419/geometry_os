; DESCRIPTION: Places a yellow line segment connecting (217, 231) to (436, 209).
; PLAN: r0=217(x1), r1=231(y1), r2=436(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 231
LDI r2, 436
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
