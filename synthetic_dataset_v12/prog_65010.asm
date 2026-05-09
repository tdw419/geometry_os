; DESCRIPTION: Places a cyan line segment connecting (428, 219) to (441, 24).
; PLAN: r0=428(x1), r1=219(y1), r2=441(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 219
LDI r2, 441
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
