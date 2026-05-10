; DESCRIPTION: Draws a yellow line from (375, 79) to (77, 113).
; PLAN: r0=375(x1), r1=79(y1), r2=77(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 79
LDI r2, 77
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
