; DESCRIPTION: Draws a green line from (214, 33) to (185, 144).
; PLAN: r0=214(x1), r1=33(y1), r2=185(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 33
LDI r2, 185
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
