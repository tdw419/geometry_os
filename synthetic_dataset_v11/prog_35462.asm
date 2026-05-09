; DESCRIPTION: Draws a white line from (221, 162) to (190, 174).
; PLAN: r0=221(x1), r1=162(y1), r2=190(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 162
LDI r2, 190
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
