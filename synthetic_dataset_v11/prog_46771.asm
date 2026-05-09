; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (188, 145) spanning 52 by 18 pixels. Then Sets a single red pixel at (104, 26).
; PLAN: r0=188(x), r1=145(y), r2=52(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (188, 145) spanning 52 by 18 pixels.
; PLAN: r0=188(x), r1=145(y), r2=52(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 145
LDI r2, 52
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (104, 26).
; PLAN: r0=104(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
