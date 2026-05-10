; DESCRIPTION: Draws a yellow line from (326, 171) to (56, 117).
; PLAN: r0=326(x1), r1=171(y1), r2=56(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 171
LDI r2, 56
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
