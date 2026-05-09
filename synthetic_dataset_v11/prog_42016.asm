; DESCRIPTION: Renders a blue line between points (31, 82) and (242, 152).
; PLAN: r0=31(x1), r1=82(y1), r2=242(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 82
LDI r2, 242
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
