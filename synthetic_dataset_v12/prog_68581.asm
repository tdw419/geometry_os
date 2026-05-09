; DESCRIPTION: Draws a white line from (280, 245) to (371, 49).
; PLAN: r0=280(x1), r1=245(y1), r2=371(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 245
LDI r2, 371
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
