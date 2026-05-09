; DESCRIPTION: Draws a magenta line from (398, 192) to (326, 182).
; PLAN: r0=398(x1), r1=192(y1), r2=326(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 192
LDI r2, 326
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
