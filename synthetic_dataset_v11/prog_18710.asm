; DESCRIPTION: Composite: . Then Sets a single purple pixel at (157, 221). Then Creates a cyan rectangular region at (155, 149) spanning 49 by 53 pixels.
; PLAN: r0=157(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=149(y), r2=49(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (157, 221).
; PLAN: r0=157(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (155, 149) spanning 49 by 53 pixels.
; PLAN: r0=155(x), r1=149(y), r2=49(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 149
LDI r2, 49
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
