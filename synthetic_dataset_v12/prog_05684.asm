; DESCRIPTION: Renders a green line between points (196, 232) and (228, 53).
; PLAN: r0=196(x1), r1=232(y1), r2=228(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 232
LDI r2, 228
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
