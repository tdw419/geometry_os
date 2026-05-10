; DESCRIPTION: Draws a green line from (331, 249) to (122, 184).
; PLAN: r0=331(x1), r1=249(y1), r2=122(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 249
LDI r2, 122
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
