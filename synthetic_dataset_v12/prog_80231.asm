; DESCRIPTION: Places a black line segment connecting (352, 99) to (313, 13).
; PLAN: r0=352(x1), r1=99(y1), r2=313(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 99
LDI r2, 313
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
