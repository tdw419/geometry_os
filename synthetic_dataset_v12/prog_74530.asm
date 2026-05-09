; DESCRIPTION: Renders a green line between points (126, 12) and (369, 168).
; PLAN: r0=126(x1), r1=12(y1), r2=369(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 12
LDI r2, 369
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
