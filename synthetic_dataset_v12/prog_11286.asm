; DESCRIPTION: Renders a green line between points (412, 55) and (163, 228).
; PLAN: r0=412(x1), r1=55(y1), r2=163(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 55
LDI r2, 163
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
