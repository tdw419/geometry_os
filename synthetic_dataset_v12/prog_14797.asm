; DESCRIPTION: Draws a red line from (66, 163) to (197, 214).
; PLAN: r0=66(x1), r1=163(y1), r2=197(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 163
LDI r2, 197
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
