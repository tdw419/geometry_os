; DESCRIPTION: Draws a purple line from (306, 95) to (386, 26).
; PLAN: r0=306(x1), r1=95(y1), r2=386(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 95
LDI r2, 386
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
