; DESCRIPTION: Renders a green line between points (475, 30) and (181, 207).
; PLAN: r0=475(x1), r1=30(y1), r2=181(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 30
LDI r2, 181
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
