; DESCRIPTION: Draws a blue line from (261, 221) to (401, 249).
; PLAN: r0=261(x1), r1=221(y1), r2=401(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 221
LDI r2, 401
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
