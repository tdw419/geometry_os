; DESCRIPTION: Draws a black line from (186, 162) to (28, 59).
; PLAN: r0=186(x1), r1=162(y1), r2=28(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 162
LDI r2, 28
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
