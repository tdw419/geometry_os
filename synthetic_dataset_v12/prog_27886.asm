; DESCRIPTION: Draws a white line from (135, 188) to (3, 177).
; PLAN: r0=135(x1), r1=188(y1), r2=3(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 188
LDI r2, 3
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
