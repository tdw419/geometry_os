; DESCRIPTION: Draws a magenta line from (234, 231) to (205, 117).
; PLAN: r0=234(x1), r1=231(y1), r2=205(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 231
LDI r2, 205
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
