; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (96, 151) spanning 31 by 54 pixels. Then Sets a single red pixel at (104, 140).
; PLAN: r0=96(x), r1=151(y), r2=31(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (96, 151) spanning 31 by 54 pixels.
; PLAN: r0=96(x), r1=151(y), r2=31(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 151
LDI r2, 31
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (104, 140).
; PLAN: r0=104(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 140
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
