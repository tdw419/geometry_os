; DESCRIPTION: Draws a magenta line from (271, 243) to (40, 83).
; PLAN: r0=271(x1), r1=243(y1), r2=40(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 243
LDI r2, 40
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
