; DESCRIPTION: Draws a white line from (106, 188) to (18, 16).
; PLAN: r0=106(x1), r1=188(y1), r2=18(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 188
LDI r2, 18
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
