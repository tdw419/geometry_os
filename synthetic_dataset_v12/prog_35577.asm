; DESCRIPTION: Draws a green line from (40, 221) to (318, 214).
; PLAN: r0=40(x1), r1=221(y1), r2=318(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 221
LDI r2, 318
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
