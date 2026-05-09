; DESCRIPTION: Composite: . Then Sets a single white pixel at (27, 135). Then Creates a red rectangular region at (31, 46) spanning 70 by 105 pixels.
; PLAN: r0=27(x), r1=135(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=31(x), r1=46(y), r2=70(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (27, 135).
; PLAN: r0=27(x), r1=135(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 135
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (31, 46) spanning 70 by 105 pixels.
; PLAN: r0=31(x), r1=46(y), r2=70(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 46
LDI r2, 70
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
