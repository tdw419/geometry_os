; DESCRIPTION: Renders a green line between points (29, 97) and (154, 253).
; PLAN: r0=29(x1), r1=97(y1), r2=154(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 97
LDI r2, 154
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
