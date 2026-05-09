; DESCRIPTION: Draws a purple line from (450, 47) to (394, 1).
; PLAN: r0=450(x1), r1=47(y1), r2=394(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 47
LDI r2, 394
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
