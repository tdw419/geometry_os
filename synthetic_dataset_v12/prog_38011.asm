; DESCRIPTION: Renders a yellow line between points (103, 91) and (228, 8).
; PLAN: r0=103(x1), r1=91(y1), r2=228(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 91
LDI r2, 228
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
