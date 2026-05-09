; DESCRIPTION: Renders a purple line between points (509, 91) and (168, 131).
; PLAN: r0=509(x1), r1=91(y1), r2=168(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 91
LDI r2, 168
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
