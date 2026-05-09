; DESCRIPTION: Places a green line segment connecting (214, 98) to (186, 93).
; PLAN: r0=214(x1), r1=98(y1), r2=186(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 98
LDI r2, 186
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
