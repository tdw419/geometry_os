; DESCRIPTION: Draws a black line from (166, 222) to (508, 12).
; PLAN: r0=166(x1), r1=222(y1), r2=508(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 222
LDI r2, 508
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
