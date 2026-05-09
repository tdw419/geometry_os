; DESCRIPTION: Renders a green line between points (459, 58) and (324, 95).
; PLAN: r0=459(x1), r1=58(y1), r2=324(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 58
LDI r2, 324
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
