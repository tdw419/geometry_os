; DESCRIPTION: Draws a magenta line from (422, 178) to (397, 69).
; PLAN: r0=422(x1), r1=178(y1), r2=397(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 178
LDI r2, 397
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
