; DESCRIPTION: Places a yellow line segment connecting (502, 119) to (69, 255).
; PLAN: r0=502(x1), r1=119(y1), r2=69(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 119
LDI r2, 69
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
