; DESCRIPTION: Renders a yellow line between points (286, 247) and (228, 183).
; PLAN: r0=286(x1), r1=247(y1), r2=228(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 247
LDI r2, 228
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
