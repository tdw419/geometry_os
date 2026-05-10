; DESCRIPTION: Draws a magenta line from (107, 244) to (400, 28).
; PLAN: r0=107(x1), r1=244(y1), r2=400(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 244
LDI r2, 400
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
