; DESCRIPTION: Draws a yellow line from (240, 213) to (58, 140).
; PLAN: r0=240(x1), r1=213(y1), r2=58(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 213
LDI r2, 58
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
