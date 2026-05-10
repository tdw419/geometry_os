; DESCRIPTION: Places a magenta line segment connecting (182, 213) to (423, 122).
; PLAN: r0=182(x1), r1=213(y1), r2=423(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 213
LDI r2, 423
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
