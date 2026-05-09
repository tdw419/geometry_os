; DESCRIPTION: Renders a green line between points (33, 70) and (326, 198).
; PLAN: r0=33(x1), r1=70(y1), r2=326(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 70
LDI r2, 326
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
