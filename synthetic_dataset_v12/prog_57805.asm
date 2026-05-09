; DESCRIPTION: Places a black line segment connecting (345, 139) to (23, 210).
; PLAN: r0=345(x1), r1=139(y1), r2=23(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 139
LDI r2, 23
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
