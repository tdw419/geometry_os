; DESCRIPTION: Draws a white line from (44, 88) to (401, 55).
; PLAN: r0=44(x1), r1=88(y1), r2=401(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 88
LDI r2, 401
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
