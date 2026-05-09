; DESCRIPTION: Places a blue line segment connecting (288, 236) to (502, 12).
; PLAN: r0=288(x1), r1=236(y1), r2=502(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 236
LDI r2, 502
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
