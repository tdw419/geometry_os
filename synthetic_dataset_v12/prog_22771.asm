; DESCRIPTION: Renders a green line between points (167, 253) and (462, 13).
; PLAN: r0=167(x1), r1=253(y1), r2=462(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 253
LDI r2, 462
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
