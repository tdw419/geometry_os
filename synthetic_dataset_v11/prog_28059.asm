; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (120, 38). Then Creates a white rectangular region at (31, 135) spanning 101 by 56 pixels.
; PLAN: r0=120(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=31(x), r1=135(y), r2=101(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (120, 38).
; PLAN: r0=120(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (31, 135) spanning 101 by 56 pixels.
; PLAN: r0=31(x), r1=135(y), r2=101(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 135
LDI r2, 101
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
