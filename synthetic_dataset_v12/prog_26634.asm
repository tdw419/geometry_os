; DESCRIPTION: Draws a yellow line from (388, 200) to (398, 101).
; PLAN: r0=388(x1), r1=200(y1), r2=398(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 200
LDI r2, 398
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
