; DESCRIPTION: Draws a magenta line from (69, 237) to (218, 132).
; PLAN: r0=69(x1), r1=237(y1), r2=218(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 237
LDI r2, 218
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
