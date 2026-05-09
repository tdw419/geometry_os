; DESCRIPTION: Draws a yellow line from (142, 48) to (150, 12).
; PLAN: r0=142(x1), r1=48(y1), r2=150(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 48
LDI r2, 150
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
