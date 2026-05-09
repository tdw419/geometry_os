; DESCRIPTION: Draws a yellow line from (271, 195) to (191, 170).
; PLAN: r0=271(x1), r1=195(y1), r2=191(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 195
LDI r2, 191
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
