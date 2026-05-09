; DESCRIPTION: Draws a red line from (428, 178) to (221, 239).
; PLAN: r0=428(x1), r1=178(y1), r2=221(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 178
LDI r2, 221
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
