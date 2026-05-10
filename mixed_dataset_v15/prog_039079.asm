; DESCRIPTION: Places a black line segment connecting (504, 127) to (408, 197).
; PLAN: r0=504(x1), r1=127(y1), r2=408(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 127
LDI r2, 408
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
