; DESCRIPTION: Composite: . Then Sets a single purple pixel at (19, 84). Then Creates a cyan rectangular region at (186, 217) spanning 26 by 31 pixels.
; PLAN: r0=19(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=186(x), r1=217(y), r2=26(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (19, 84).
; PLAN: r0=19(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (186, 217) spanning 26 by 31 pixels.
; PLAN: r0=186(x), r1=217(y), r2=26(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 217
LDI r2, 26
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
