; DESCRIPTION: Draws a white line from (68, 66) to (401, 36).
; PLAN: r0=68(x1), r1=66(y1), r2=401(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 66
LDI r2, 401
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
