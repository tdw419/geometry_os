; DESCRIPTION: Places a green line segment connecting (251, 232) to (248, 228).
; PLAN: r0=251(x1), r1=232(y1), r2=248(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 232
LDI r2, 248
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
