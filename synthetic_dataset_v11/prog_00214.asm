; DESCRIPTION: Composite: . Then Sets a single purple pixel at (188, 30). Then Creates a purple rectangular region at (106, 2) spanning 108 by 117 pixels.
; PLAN: r0=188(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=106(x), r1=2(y), r2=108(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (188, 30).
; PLAN: r0=188(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (106, 2) spanning 108 by 117 pixels.
; PLAN: r0=106(x), r1=2(y), r2=108(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 2
LDI r2, 108
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
