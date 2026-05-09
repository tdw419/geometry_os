; DESCRIPTION: Places a black line segment connecting (40, 152) to (60, 29).
; PLAN: r0=40(x1), r1=152(y1), r2=60(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 152
LDI r2, 60
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
