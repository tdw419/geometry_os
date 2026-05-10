; DESCRIPTION: Draws a yellow line from (171, 211) to (87, 184).
; PLAN: r0=171(x1), r1=211(y1), r2=87(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 211
LDI r2, 87
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
