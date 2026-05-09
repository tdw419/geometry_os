; DESCRIPTION: Draws a green line from (490, 158) to (445, 237).
; PLAN: r0=490(x1), r1=158(y1), r2=445(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 158
LDI r2, 445
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
