; DESCRIPTION: Draws a black line from (473, 168) to (57, 253).
; PLAN: r0=473(x1), r1=168(y1), r2=57(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 168
LDI r2, 57
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
