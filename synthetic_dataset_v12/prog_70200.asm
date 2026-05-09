; DESCRIPTION: Renders a green line between points (459, 29) and (215, 186).
; PLAN: r0=459(x1), r1=29(y1), r2=215(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 29
LDI r2, 215
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
