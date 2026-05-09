; DESCRIPTION: Places a white line segment connecting (186, 202) to (86, 144).
; PLAN: r0=186(x1), r1=202(y1), r2=86(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 202
LDI r2, 86
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
