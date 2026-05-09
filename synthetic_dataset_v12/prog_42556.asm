; DESCRIPTION: Draws a blue line from (504, 186) to (63, 253).
; PLAN: r0=504(x1), r1=186(y1), r2=63(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 186
LDI r2, 63
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
