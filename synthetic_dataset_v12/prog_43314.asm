; DESCRIPTION: Renders a blue line between points (61, 22) and (401, 26).
; PLAN: r0=61(x1), r1=22(y1), r2=401(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 22
LDI r2, 401
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
