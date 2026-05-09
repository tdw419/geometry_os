; DESCRIPTION: Draws a blue line from (384, 71) to (218, 14).
; PLAN: r0=384(x1), r1=71(y1), r2=218(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 71
LDI r2, 218
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
