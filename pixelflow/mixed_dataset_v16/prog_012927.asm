; DESCRIPTION: Draws a green line from (381, 202) to (40, 8).
; PLAN: r0=381(x1), r1=202(y1), r2=40(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 202
LDI r2, 40
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
