; DESCRIPTION: Places a white line segment connecting (388, 152) to (244, 210).
; PLAN: r0=388(x1), r1=152(y1), r2=244(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 152
LDI r2, 244
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
