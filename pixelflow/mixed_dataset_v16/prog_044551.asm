; DESCRIPTION: Draws a blue line from (336, 55) to (214, 57).
; PLAN: r0=336(x1), r1=55(y1), r2=214(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 55
LDI r2, 214
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
