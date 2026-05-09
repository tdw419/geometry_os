; DESCRIPTION: Renders a yellow line between points (220, 228) and (164, 163).
; PLAN: r0=220(x1), r1=228(y1), r2=164(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 228
LDI r2, 164
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
