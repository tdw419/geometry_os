; DESCRIPTION: Places a white line segment connecting (225, 144) to (135, 24).
; PLAN: r0=225(x1), r1=144(y1), r2=135(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 144
LDI r2, 135
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
