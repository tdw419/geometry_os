; DESCRIPTION: Places a black line segment connecting (166, 30) to (39, 197).
; PLAN: r0=166(x1), r1=30(y1), r2=39(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 30
LDI r2, 39
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
