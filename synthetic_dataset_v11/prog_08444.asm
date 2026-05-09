; DESCRIPTION: Renders a blue line between points (236, 207) and (119, 213).
; PLAN: r0=236(x1), r1=207(y1), r2=119(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 207
LDI r2, 119
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
