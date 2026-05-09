; DESCRIPTION: Composite: . Then Sets a single purple pixel at (83, 103). Then Creates a red rectangular region at (186, 5) spanning 12 by 77 pixels.
; PLAN: r0=83(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=186(x), r1=5(y), r2=12(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (83, 103).
; PLAN: r0=83(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (186, 5) spanning 12 by 77 pixels.
; PLAN: r0=186(x), r1=5(y), r2=12(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 5
LDI r2, 12
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
