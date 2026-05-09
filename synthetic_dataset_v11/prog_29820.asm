; DESCRIPTION: Renders a blue line between points (225, 128) and (242, 235).
; PLAN: r0=225(x1), r1=128(y1), r2=242(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 128
LDI r2, 242
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
