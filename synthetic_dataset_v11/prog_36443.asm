; DESCRIPTION: Draws a yellow line from (218, 63) to (177, 166).
; PLAN: r0=218(x1), r1=63(y1), r2=177(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 63
LDI r2, 177
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
