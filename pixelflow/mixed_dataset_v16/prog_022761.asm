; DESCRIPTION: Draws a green line from (149, 38) to (413, 103).
; PLAN: r0=149(x1), r1=38(y1), r2=413(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 38
LDI r2, 413
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
