; DESCRIPTION: Composite: . Then Creates a black rectangular region at (85, 20) spanning 70 by 39 pixels. Then Sets a single red pixel at (68, 72).
; PLAN: r0=85(x), r1=20(y), r2=70(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=68(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (85, 20) spanning 70 by 39 pixels.
; PLAN: r0=85(x), r1=20(y), r2=70(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 20
LDI r2, 70
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (68, 72).
; PLAN: r0=68(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
