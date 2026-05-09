; DESCRIPTION: Renders a purple line between points (148, 32) and (386, 209).
; PLAN: r0=148(x1), r1=32(y1), r2=386(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 32
LDI r2, 386
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
