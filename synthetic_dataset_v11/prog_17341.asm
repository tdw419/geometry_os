; DESCRIPTION: Renders a blue line between points (114, 152) and (61, 192).
; PLAN: r0=114(x1), r1=152(y1), r2=61(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 152
LDI r2, 61
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
