; DESCRIPTION: Draws a red line from (280, 113) to (198, 165).
; PLAN: r0=280(x1), r1=113(y1), r2=198(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 113
LDI r2, 198
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
