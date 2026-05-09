; DESCRIPTION: Draws a magenta line from (6, 223) to (144, 210).
; PLAN: r0=6(x1), r1=223(y1), r2=144(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 223
LDI r2, 144
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
