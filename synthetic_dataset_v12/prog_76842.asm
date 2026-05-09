; DESCRIPTION: Renders a green line between points (336, 153) and (135, 127).
; PLAN: r0=336(x1), r1=153(y1), r2=135(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 153
LDI r2, 135
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
