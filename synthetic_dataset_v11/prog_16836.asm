; DESCRIPTION: Draws a black line from (23, 40) to (26, 174).
; PLAN: r0=23(x1), r1=40(y1), r2=26(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 40
LDI r2, 26
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
