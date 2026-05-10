; DESCRIPTION: Draws a black line from (313, 194) to (306, 46).
; PLAN: r0=313(x1), r1=194(y1), r2=306(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 194
LDI r2, 306
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
