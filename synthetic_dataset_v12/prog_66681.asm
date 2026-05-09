; DESCRIPTION: Draws a red line from (473, 250) to (482, 49).
; PLAN: r0=473(x1), r1=250(y1), r2=482(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 250
LDI r2, 482
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
