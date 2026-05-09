; DESCRIPTION: Draws a green line from (24, 8) to (285, 22).
; PLAN: r0=24(x1), r1=8(y1), r2=285(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 8
LDI r2, 285
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
