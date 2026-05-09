; DESCRIPTION: Draws a green line from (373, 206) to (418, 70).
; PLAN: r0=373(x1), r1=206(y1), r2=418(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 206
LDI r2, 418
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
