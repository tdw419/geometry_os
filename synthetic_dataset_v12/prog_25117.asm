; DESCRIPTION: Draws a purple line from (504, 213) to (53, 142).
; PLAN: r0=504(x1), r1=213(y1), r2=53(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 213
LDI r2, 53
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
