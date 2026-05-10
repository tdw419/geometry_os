; DESCRIPTION: Draws a magenta line from (482, 200) to (42, 97).
; PLAN: r0=482(x1), r1=200(y1), r2=42(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 200
LDI r2, 42
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
