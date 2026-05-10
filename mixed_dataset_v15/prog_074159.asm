; DESCRIPTION: Draws a yellow line from (379, 193) to (405, 59).
; PLAN: r0=379(x1), r1=193(y1), r2=405(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 193
LDI r2, 405
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
