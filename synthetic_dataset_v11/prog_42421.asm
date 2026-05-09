; DESCRIPTION: Draws a blue line from (248, 215) to (60, 238).
; PLAN: r0=248(x1), r1=215(y1), r2=60(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 215
LDI r2, 60
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
