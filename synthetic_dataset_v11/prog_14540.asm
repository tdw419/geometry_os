; DESCRIPTION: Draws a green line from (21, 56) to (171, 206).
; PLAN: r0=21(x1), r1=56(y1), r2=171(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 56
LDI r2, 171
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
