; DESCRIPTION: Renders a purple line between points (406, 121) and (397, 14).
; PLAN: r0=406(x1), r1=121(y1), r2=397(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 121
LDI r2, 397
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
