; DESCRIPTION: Renders a green line between points (64, 246) and (232, 174).
; PLAN: r0=64(x1), r1=246(y1), r2=232(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 246
LDI r2, 232
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
