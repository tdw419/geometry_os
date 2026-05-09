; DESCRIPTION: Draws a white line from (163, 46) to (324, 113).
; PLAN: r0=163(x1), r1=46(y1), r2=324(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 46
LDI r2, 324
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
