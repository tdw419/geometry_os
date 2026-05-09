; DESCRIPTION: Renders a green line between points (482, 231) and (194, 51).
; PLAN: r0=482(x1), r1=231(y1), r2=194(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 231
LDI r2, 194
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
