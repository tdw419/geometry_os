; DESCRIPTION: Renders a green line between points (504, 15) and (280, 219).
; PLAN: r0=504(x1), r1=15(y1), r2=280(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 15
LDI r2, 280
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
