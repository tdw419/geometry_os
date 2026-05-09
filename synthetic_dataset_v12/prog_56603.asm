; DESCRIPTION: Draws a green line from (21, 233) to (232, 253).
; PLAN: r0=21(x1), r1=233(y1), r2=232(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 233
LDI r2, 232
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
