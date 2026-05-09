; DESCRIPTION: Draws a magenta line from (198, 0) to (53, 43).
; PLAN: r0=198(x1), r1=0(y1), r2=53(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 0
LDI r2, 53
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
