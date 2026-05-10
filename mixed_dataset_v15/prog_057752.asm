; DESCRIPTION: Draws a magenta line from (53, 192) to (366, 197).
; PLAN: r0=53(x1), r1=192(y1), r2=366(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 192
LDI r2, 366
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
