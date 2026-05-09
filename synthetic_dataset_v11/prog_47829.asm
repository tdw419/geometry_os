; DESCRIPTION: Composite: . Then Sets a single red pixel at (65, 127). Then Creates a black rectangular region at (138, 77) spanning 12 by 113 pixels.
; PLAN: r0=65(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=77(y), r2=12(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (65, 127).
; PLAN: r0=65(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (138, 77) spanning 12 by 113 pixels.
; PLAN: r0=138(x), r1=77(y), r2=12(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 77
LDI r2, 12
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
