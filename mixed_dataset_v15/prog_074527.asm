; DESCRIPTION: Draws a yellow line from (409, 107) to (264, 249).
; PLAN: r0=409(x1), r1=107(y1), r2=264(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 107
LDI r2, 264
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
