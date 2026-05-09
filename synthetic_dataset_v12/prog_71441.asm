; DESCRIPTION: Renders a yellow line between points (259, 132) and (208, 115).
; PLAN: r0=259(x1), r1=132(y1), r2=208(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 132
LDI r2, 208
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
