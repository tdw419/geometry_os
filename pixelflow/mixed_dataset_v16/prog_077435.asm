; DESCRIPTION: Draws a yellow line from (185, 214) to (433, 32).
; PLAN: r0=185(x1), r1=214(y1), r2=433(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 214
LDI r2, 433
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
