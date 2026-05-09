; DESCRIPTION: Places a magenta line segment connecting (401, 16) to (347, 213).
; PLAN: r0=401(x1), r1=16(y1), r2=347(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 16
LDI r2, 347
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
