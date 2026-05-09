; DESCRIPTION: Draws a green line from (108, 74) to (206, 237).
; PLAN: r0=108(x1), r1=74(y1), r2=206(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 74
LDI r2, 206
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
