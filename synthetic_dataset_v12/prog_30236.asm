; DESCRIPTION: Draws a magenta line from (117, 4) to (367, 207).
; PLAN: r0=117(x1), r1=4(y1), r2=367(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 4
LDI r2, 367
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
