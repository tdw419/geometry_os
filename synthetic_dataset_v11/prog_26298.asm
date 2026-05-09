; DESCRIPTION: Draws a purple line from (183, 111) to (187, 197).
; PLAN: r0=183(x1), r1=111(y1), r2=187(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 111
LDI r2, 187
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
