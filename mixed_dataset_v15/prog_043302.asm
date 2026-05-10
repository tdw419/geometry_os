; DESCRIPTION: Draws a magenta line from (367, 115) to (303, 115).
; PLAN: r0=367(x1), r1=115(y1), r2=303(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 115
LDI r2, 303
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
