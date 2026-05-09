; DESCRIPTION: Draws a red line from (431, 130) to (207, 59).
; PLAN: r0=431(x1), r1=130(y1), r2=207(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 130
LDI r2, 207
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
