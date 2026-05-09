; DESCRIPTION: Renders a yellow line between points (466, 127) and (228, 83).
; PLAN: r0=466(x1), r1=127(y1), r2=228(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 127
LDI r2, 228
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
