; DESCRIPTION: Composite: . Then Sets a single orange pixel at (57, 99). Then Creates a white rectangular region at (45, 96) spanning 21 by 60 pixels.
; PLAN: r0=57(x), r1=99(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=45(x), r1=96(y), r2=21(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (57, 99).
; PLAN: r0=57(x), r1=99(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 99
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (45, 96) spanning 21 by 60 pixels.
; PLAN: r0=45(x), r1=96(y), r2=21(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 21
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
