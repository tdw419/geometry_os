; DESCRIPTION: Renders a yellow line between points (151, 67) and (275, 220).
; PLAN: r0=151(x1), r1=67(y1), r2=275(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 67
LDI r2, 275
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
