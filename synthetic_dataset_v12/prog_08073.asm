; DESCRIPTION: Places a blue line segment connecting (4, 210) to (401, 127).
; PLAN: r0=4(x1), r1=210(y1), r2=401(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 210
LDI r2, 401
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
