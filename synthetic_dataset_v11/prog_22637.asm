; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (151, 61) to (196, 236). Then Sets a single green pixel at (50, 205).
; PLAN: r0=151(x1), r1=61(y1), r2=196(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (151, 61) to (196, 236).
; PLAN: r0=151(x1), r1=61(y1), r2=196(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 61
LDI r2, 196
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (50, 205).
; PLAN: r0=50(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
