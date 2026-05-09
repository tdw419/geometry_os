; DESCRIPTION: Places a green line segment connecting (8, 136) to (231, 253).
; PLAN: r0=8(x1), r1=136(y1), r2=231(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 136
LDI r2, 231
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
