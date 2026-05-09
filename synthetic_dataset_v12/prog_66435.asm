; DESCRIPTION: Places a green line segment connecting (416, 115) to (236, 209).
; PLAN: r0=416(x1), r1=115(y1), r2=236(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 115
LDI r2, 236
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
