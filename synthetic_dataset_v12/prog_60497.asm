; DESCRIPTION: Draws a magenta line from (409, 113) to (66, 196).
; PLAN: r0=409(x1), r1=113(y1), r2=66(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 113
LDI r2, 66
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
