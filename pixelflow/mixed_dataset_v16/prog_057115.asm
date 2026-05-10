; DESCRIPTION: Draws a white line from (435, 2) to (44, 222).
; PLAN: r0=435(x1), r1=2(y1), r2=44(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 2
LDI r2, 44
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
