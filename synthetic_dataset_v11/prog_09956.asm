; DESCRIPTION: Draws a blue line from (166, 59) to (120, 17).
; PLAN: r0=166(x1), r1=59(y1), r2=120(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 59
LDI r2, 120
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
