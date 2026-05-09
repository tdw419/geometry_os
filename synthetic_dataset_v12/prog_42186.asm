; DESCRIPTION: Renders a yellow line between points (130, 103) and (189, 228).
; PLAN: r0=130(x1), r1=103(y1), r2=189(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 103
LDI r2, 189
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
