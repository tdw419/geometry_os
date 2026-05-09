; DESCRIPTION: Draws a magenta line from (46, 168) to (104, 13).
; PLAN: r0=46(x1), r1=168(y1), r2=104(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 168
LDI r2, 104
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
