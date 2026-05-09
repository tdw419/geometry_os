; DESCRIPTION: Composite: . Then Places a blue line segment connecting (95, 239) to (224, 84). Then Sets a single orange pixel at (118, 230).
; PLAN: r0=95(x1), r1=239(y1), r2=224(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (95, 239) to (224, 84).
; PLAN: r0=95(x1), r1=239(y1), r2=224(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 239
LDI r2, 224
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (118, 230).
; PLAN: r0=118(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
