; DESCRIPTION: Places a magenta line segment connecting (401, 50) to (213, 151).
; PLAN: r0=401(x1), r1=50(y1), r2=213(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 50
LDI r2, 213
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
