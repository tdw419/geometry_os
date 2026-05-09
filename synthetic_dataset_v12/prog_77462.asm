; DESCRIPTION: Draws a magenta line from (243, 249) to (46, 219).
; PLAN: r0=243(x1), r1=249(y1), r2=46(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 249
LDI r2, 46
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
