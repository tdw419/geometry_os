; DESCRIPTION: Draws a magenta line from (179, 39) to (199, 210).
; PLAN: r0=179(x1), r1=39(y1), r2=199(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 39
LDI r2, 199
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
