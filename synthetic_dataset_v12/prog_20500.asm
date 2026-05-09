; DESCRIPTION: Draws a yellow line from (124, 48) to (300, 98).
; PLAN: r0=124(x1), r1=48(y1), r2=300(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 48
LDI r2, 300
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
