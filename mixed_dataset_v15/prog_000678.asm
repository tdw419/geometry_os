; DESCRIPTION: Renders a yellow line between points (345, 195) and (401, 34).
; PLAN: r0=345(x1), r1=195(y1), r2=401(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 195
LDI r2, 401
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
