; DESCRIPTION: Draws a green line from (335, 214) to (446, 189).
; PLAN: r0=335(x1), r1=214(y1), r2=446(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 214
LDI r2, 446
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
