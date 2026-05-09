; DESCRIPTION: Draws a green line from (501, 54) to (401, 178).
; PLAN: r0=501(x1), r1=54(y1), r2=401(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 54
LDI r2, 401
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
