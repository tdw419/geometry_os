; DESCRIPTION: Places a magenta line segment connecting (362, 122) to (443, 190).
; PLAN: r0=362(x1), r1=122(y1), r2=443(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 122
LDI r2, 443
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
