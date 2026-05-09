; DESCRIPTION: Renders a black line between points (288, 67) and (473, 176).
; PLAN: r0=288(x1), r1=67(y1), r2=473(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 67
LDI r2, 473
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
