; DESCRIPTION: Draws a green line from (258, 142) to (263, 230).
; PLAN: r0=258(x1), r1=142(y1), r2=263(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 142
LDI r2, 263
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
