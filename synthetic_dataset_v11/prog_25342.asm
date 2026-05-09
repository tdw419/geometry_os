; DESCRIPTION: Composite: . Then Places a white line segment connecting (144, 84) to (50, 118). Then Places a magenta dot at position (224, 145).
; PLAN: r0=144(x1), r1=84(y1), r2=50(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=224(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (144, 84) to (50, 118).
; PLAN: r0=144(x1), r1=84(y1), r2=50(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 84
LDI r2, 50
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (224, 145).
; PLAN: r0=224(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
