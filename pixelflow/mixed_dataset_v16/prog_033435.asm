; DESCRIPTION: Draws a white line from (108, 249) to (321, 191).
; PLAN: r0=108(x1), r1=249(y1), r2=321(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 249
LDI r2, 321
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
