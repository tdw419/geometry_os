; DESCRIPTION: Draws a yellow line from (509, 254) to (504, 211).
; PLAN: r0=509(x1), r1=254(y1), r2=504(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 254
LDI r2, 504
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
