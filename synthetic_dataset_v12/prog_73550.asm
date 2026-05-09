; DESCRIPTION: Places a black line segment connecting (279, 166) to (39, 222).
; PLAN: r0=279(x1), r1=166(y1), r2=39(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 166
LDI r2, 39
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
