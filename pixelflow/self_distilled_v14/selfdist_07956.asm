; DESCRIPTION: Draws a purple line from (268, 197) to (57, 187).
; PLAN: r0=268(x1), r1=197(y1), r2=57(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 197
LDI r2, 57
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
