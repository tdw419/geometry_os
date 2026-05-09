; DESCRIPTION: Renders a green line between points (198, 40) and (397, 168).
; PLAN: r0=198(x1), r1=40(y1), r2=397(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 40
LDI r2, 397
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
