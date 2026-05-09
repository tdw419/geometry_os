; DESCRIPTION: Composite: . Then Creates a green rectangular region at (216, 28) spanning 14 by 75 pixels. Then Sets a single orange pixel at (249, 123).
; PLAN: r0=216(x), r1=28(y), r2=14(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (216, 28) spanning 14 by 75 pixels.
; PLAN: r0=216(x), r1=28(y), r2=14(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 28
LDI r2, 14
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (249, 123).
; PLAN: r0=249(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
