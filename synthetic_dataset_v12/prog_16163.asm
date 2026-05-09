; DESCRIPTION: Renders a yellow line between points (153, 231) and (153, 235).
; PLAN: r0=153(x1), r1=231(y1), r2=153(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 231
LDI r2, 153
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
