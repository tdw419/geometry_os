; DESCRIPTION: Composite: . Then Draws a green circle centered at (152, 96) with radius 54. Then Sets a single red pixel at (60, 201).
; PLAN: r0=152(x), r1=96(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (152, 96) with radius 54.
; PLAN: r0=152(x), r1=96(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 96
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (60, 201).
; PLAN: r0=60(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
