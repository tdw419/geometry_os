; DESCRIPTION: Draws a white line from (349, 232) to (242, 214).
; PLAN: r0=349(x1), r1=232(y1), r2=242(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 232
LDI r2, 242
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
