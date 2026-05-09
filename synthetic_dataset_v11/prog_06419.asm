; DESCRIPTION: Renders a green line between points (67, 221) and (136, 7).
; PLAN: r0=67(x1), r1=221(y1), r2=136(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 221
LDI r2, 136
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
