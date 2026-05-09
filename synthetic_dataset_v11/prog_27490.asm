; DESCRIPTION: Places a green line segment connecting (101, 111) to (253, 231).
; PLAN: r0=101(x1), r1=111(y1), r2=253(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 111
LDI r2, 253
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
