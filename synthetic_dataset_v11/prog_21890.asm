; DESCRIPTION: Composite: . Then Sets a single white pixel at (128, 170). Then Creates a orange rectangular region at (87, 2) spanning 33 by 87 pixels.
; PLAN: r0=128(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=2(y), r2=33(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (128, 170).
; PLAN: r0=128(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (87, 2) spanning 33 by 87 pixels.
; PLAN: r0=87(x), r1=2(y), r2=33(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 2
LDI r2, 33
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
