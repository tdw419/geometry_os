; DESCRIPTION: Draws a yellow line from (317, 98) to (29, 49).
; PLAN: r0=317(x1), r1=98(y1), r2=29(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 98
LDI r2, 29
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
