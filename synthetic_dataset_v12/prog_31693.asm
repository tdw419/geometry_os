; DESCRIPTION: Renders a blue line between points (301, 249) and (384, 207).
; PLAN: r0=301(x1), r1=249(y1), r2=384(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 249
LDI r2, 384
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
