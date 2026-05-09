; DESCRIPTION: Draws a green line from (473, 43) to (220, 67).
; PLAN: r0=473(x1), r1=43(y1), r2=220(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 43
LDI r2, 220
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
