; DESCRIPTION: Draws a white line from (367, 8) to (334, 152).
; PLAN: r0=367(x1), r1=8(y1), r2=334(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 8
LDI r2, 334
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
