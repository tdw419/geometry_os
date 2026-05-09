; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (177, 5). Then Creates a red rectangular region at (172, 40) spanning 38 by 108 pixels.
; PLAN: r0=177(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=172(x), r1=40(y), r2=38(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (177, 5).
; PLAN: r0=177(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (172, 40) spanning 38 by 108 pixels.
; PLAN: r0=172(x), r1=40(y), r2=38(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 40
LDI r2, 38
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
