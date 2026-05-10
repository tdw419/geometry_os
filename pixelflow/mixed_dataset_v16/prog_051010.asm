; DESCRIPTION: Renders a green line between points (480, 191) and (369, 91).
; PLAN: r0=480(x1), r1=191(y1), r2=369(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 191
LDI r2, 369
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
