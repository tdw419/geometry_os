; DESCRIPTION: Draws a white line from (418, 65) to (108, 0).
; PLAN: r0=418(x1), r1=65(y1), r2=108(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 65
LDI r2, 108
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
