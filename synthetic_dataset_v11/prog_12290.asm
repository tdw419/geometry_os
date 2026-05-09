; DESCRIPTION: Composite: . Then Sets a single purple pixel at (62, 236). Then Creates a cyan rectangular region at (18, 115) spanning 34 by 23 pixels.
; PLAN: r0=62(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=18(x), r1=115(y), r2=34(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (62, 236).
; PLAN: r0=62(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (18, 115) spanning 34 by 23 pixels.
; PLAN: r0=18(x), r1=115(y), r2=34(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 115
LDI r2, 34
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
