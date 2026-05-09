; DESCRIPTION: Renders a yellow line between points (454, 27) and (473, 150).
; PLAN: r0=454(x1), r1=27(y1), r2=473(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 27
LDI r2, 473
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
