; DESCRIPTION: Renders a yellow line between points (428, 108) and (299, 223).
; PLAN: r0=428(x1), r1=108(y1), r2=299(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 108
LDI r2, 299
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
