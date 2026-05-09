; DESCRIPTION: Draws a yellow line from (197, 151) to (297, 204).
; PLAN: r0=197(x1), r1=151(y1), r2=297(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 151
LDI r2, 297
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
