; DESCRIPTION: Draws a green line from (197, 111) to (486, 12).
; PLAN: r0=197(x1), r1=111(y1), r2=486(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 111
LDI r2, 486
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
