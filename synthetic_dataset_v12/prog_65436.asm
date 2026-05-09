; DESCRIPTION: Draws a black line from (225, 99) to (57, 205).
; PLAN: r0=225(x1), r1=99(y1), r2=57(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 99
LDI r2, 57
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
