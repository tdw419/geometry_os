; DESCRIPTION: Renders a blue line between points (401, 31) and (54, 31).
; PLAN: r0=401(x1), r1=31(y1), r2=54(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 31
LDI r2, 54
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
