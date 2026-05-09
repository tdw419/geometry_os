; DESCRIPTION: Draws a blue line from (178, 131) to (349, 242).
; PLAN: r0=178(x1), r1=131(y1), r2=349(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 131
LDI r2, 349
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
