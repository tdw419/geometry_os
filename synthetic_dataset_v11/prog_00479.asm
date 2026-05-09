; DESCRIPTION: Places a white line segment connecting (24, 54) to (255, 152).
; PLAN: r0=24(x1), r1=54(y1), r2=255(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 54
LDI r2, 255
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
