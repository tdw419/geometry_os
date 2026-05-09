; DESCRIPTION: Places a green line segment connecting (194, 86) to (175, 253).
; PLAN: r0=194(x1), r1=86(y1), r2=175(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 86
LDI r2, 175
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
