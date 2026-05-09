; DESCRIPTION: Composite: . Then Sets a single red pixel at (24, 179). Then Creates a cyan rectangular region at (39, 22) spanning 33 by 119 pixels.
; PLAN: r0=24(x), r1=179(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=39(x), r1=22(y), r2=33(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (24, 179).
; PLAN: r0=24(x), r1=179(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 179
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (39, 22) spanning 33 by 119 pixels.
; PLAN: r0=39(x), r1=22(y), r2=33(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 22
LDI r2, 33
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
