; DESCRIPTION: Draws a green line from (366, 204) to (401, 131).
; PLAN: r0=366(x1), r1=204(y1), r2=401(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 204
LDI r2, 401
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
