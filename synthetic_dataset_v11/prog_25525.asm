; DESCRIPTION: Composite: . Then Sets a single red pixel at (222, 56). Then Creates a cyan rectangular region at (120, 94) spanning 66 by 11 pixels.
; PLAN: r0=222(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=120(x), r1=94(y), r2=66(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (222, 56).
; PLAN: r0=222(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (120, 94) spanning 66 by 11 pixels.
; PLAN: r0=120(x), r1=94(y), r2=66(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 94
LDI r2, 66
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
