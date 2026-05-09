; DESCRIPTION: Draws a yellow line from (445, 60) to (416, 92).
; PLAN: r0=445(x1), r1=60(y1), r2=416(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 60
LDI r2, 416
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
