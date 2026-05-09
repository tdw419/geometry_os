; DESCRIPTION: Composite: . Then Places a magenta 79x60 rectangle at position (124, 136). Then Sets a single orange pixel at (233, 20).
; PLAN: r0=124(x), r1=136(y), r2=79(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=233(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 79x60 rectangle at position (124, 136).
; PLAN: r0=124(x), r1=136(y), r2=79(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 136
LDI r2, 79
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (233, 20).
; PLAN: r0=233(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
