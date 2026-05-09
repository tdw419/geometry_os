; DESCRIPTION: Draws a blue line from (273, 60) to (171, 214).
; PLAN: r0=273(x1), r1=60(y1), r2=171(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 60
LDI r2, 171
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
