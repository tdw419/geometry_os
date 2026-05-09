; DESCRIPTION: Draws a blue line from (193, 0) to (168, 108).
; PLAN: r0=193(x1), r1=0(y1), r2=168(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 0
LDI r2, 168
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
