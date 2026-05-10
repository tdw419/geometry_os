; DESCRIPTION: Draws a blue line from (143, 21) to (218, 0).
; PLAN: r0=143(x1), r1=21(y1), r2=218(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 21
LDI r2, 218
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
