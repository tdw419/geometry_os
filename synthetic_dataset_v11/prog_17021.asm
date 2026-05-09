; DESCRIPTION: Composite: . Then Creates a black rectangular region at (87, 176) spanning 44 by 22 pixels. Then Sets a single white pixel at (85, 65).
; PLAN: r0=87(x), r1=176(y), r2=44(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=85(x), r1=65(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (87, 176) spanning 44 by 22 pixels.
; PLAN: r0=87(x), r1=176(y), r2=44(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 44
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (85, 65).
; PLAN: r0=85(x), r1=65(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 65
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
