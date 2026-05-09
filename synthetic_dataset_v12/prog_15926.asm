; DESCRIPTION: Draws a blue line from (248, 28) to (268, 68).
; PLAN: r0=248(x1), r1=28(y1), r2=268(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 28
LDI r2, 268
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
