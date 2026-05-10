; DESCRIPTION: Draws a magenta line from (223, 195) to (38, 28).
; PLAN: r0=223(x1), r1=195(y1), r2=38(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 195
LDI r2, 38
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
