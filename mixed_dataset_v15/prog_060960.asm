; DESCRIPTION: Draws a blue line from (405, 247) to (231, 244).
; PLAN: r0=405(x1), r1=247(y1), r2=231(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 247
LDI r2, 231
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
