; DESCRIPTION: Draws a yellow line from (487, 200) to (179, 2).
; PLAN: r0=487(x1), r1=200(y1), r2=179(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 200
LDI r2, 179
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
