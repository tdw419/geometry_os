; DESCRIPTION: Draws a white line from (468, 152) to (371, 109).
; PLAN: r0=468(x1), r1=152(y1), r2=371(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 152
LDI r2, 371
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
