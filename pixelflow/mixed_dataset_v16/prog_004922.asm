; DESCRIPTION: Draws a green line from (405, 226) to (110, 58).
; PLAN: r0=405(x1), r1=226(y1), r2=110(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 226
LDI r2, 110
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
