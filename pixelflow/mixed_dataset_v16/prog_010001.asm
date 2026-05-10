; DESCRIPTION: Draws a green line from (486, 58) to (391, 143).
; PLAN: r0=486(x1), r1=58(y1), r2=391(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 58
LDI r2, 391
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
