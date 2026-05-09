; DESCRIPTION: Draws a magenta line from (49, 24) to (182, 29).
; PLAN: r0=49(x1), r1=24(y1), r2=182(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 24
LDI r2, 182
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
