; DESCRIPTION: Draws a magenta line from (46, 161) to (187, 117).
; PLAN: r0=46(x1), r1=161(y1), r2=187(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 161
LDI r2, 187
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
