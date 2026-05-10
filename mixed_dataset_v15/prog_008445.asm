; DESCRIPTION: Places a magenta line segment connecting (401, 180) to (433, 118).
; PLAN: r0=401(x1), r1=180(y1), r2=433(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 180
LDI r2, 433
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
