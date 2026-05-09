; DESCRIPTION: Draws a green line from (220, 0) to (142, 109).
; PLAN: r0=220(x1), r1=0(y1), r2=142(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 0
LDI r2, 142
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
