; DESCRIPTION: Renders a white line between points (339, 99) and (401, 133).
; PLAN: r0=339(x1), r1=99(y1), r2=401(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 99
LDI r2, 401
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
