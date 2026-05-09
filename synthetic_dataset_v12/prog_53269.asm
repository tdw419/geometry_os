; DESCRIPTION: Places a white line segment connecting (216, 230) to (300, 253).
; PLAN: r0=216(x1), r1=230(y1), r2=300(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 230
LDI r2, 300
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
