; DESCRIPTION: Draws a magenta line from (400, 44) to (271, 211).
; PLAN: r0=400(x1), r1=44(y1), r2=271(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 44
LDI r2, 271
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
