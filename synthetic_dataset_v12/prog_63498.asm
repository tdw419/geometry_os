; DESCRIPTION: Renders a blue line between points (405, 235) and (379, 168).
; PLAN: r0=405(x1), r1=235(y1), r2=379(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 235
LDI r2, 379
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
