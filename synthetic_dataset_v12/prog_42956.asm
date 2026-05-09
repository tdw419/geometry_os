; DESCRIPTION: Draws a blue line from (373, 254) to (398, 37).
; PLAN: r0=373(x1), r1=254(y1), r2=398(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 254
LDI r2, 398
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
