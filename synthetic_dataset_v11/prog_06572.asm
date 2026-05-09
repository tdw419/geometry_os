; DESCRIPTION: Renders a blue line between points (166, 226) and (168, 251).
; PLAN: r0=166(x1), r1=226(y1), r2=168(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 226
LDI r2, 168
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
