; DESCRIPTION: Draws a magenta line from (442, 68) to (150, 45).
; PLAN: r0=442(x1), r1=68(y1), r2=150(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 68
LDI r2, 150
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
