; DESCRIPTION: Places a green line segment connecting (174, 221) to (186, 136).
; PLAN: r0=174(x1), r1=221(y1), r2=186(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 221
LDI r2, 186
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
