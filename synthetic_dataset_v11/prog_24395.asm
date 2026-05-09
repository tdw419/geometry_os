; DESCRIPTION: Draws a yellow line from (87, 176) to (138, 174).
; PLAN: r0=87(x1), r1=176(y1), r2=138(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 138
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
