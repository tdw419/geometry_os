; DESCRIPTION: Draws a yellow line from (487, 164) to (105, 1).
; PLAN: r0=487(x1), r1=164(y1), r2=105(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 164
LDI r2, 105
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
