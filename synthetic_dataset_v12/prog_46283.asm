; DESCRIPTION: Draws a blue line from (218, 171) to (405, 70).
; PLAN: r0=218(x1), r1=171(y1), r2=405(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 171
LDI r2, 405
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
