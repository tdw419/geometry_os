; DESCRIPTION: Renders a blue line between points (235, 99) and (388, 222).
; PLAN: r0=235(x1), r1=99(y1), r2=388(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 99
LDI r2, 388
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
