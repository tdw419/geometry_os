; DESCRIPTION: Draws a green line from (108, 215) to (308, 112).
; PLAN: r0=108(x1), r1=215(y1), r2=308(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 215
LDI r2, 308
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
