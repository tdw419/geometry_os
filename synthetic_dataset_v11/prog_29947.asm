; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (141, 199) spanning 105 by 34 pixels. Then Draws a cyan circle centered at (194, 82) with radius 27.
; PLAN: r0=141(x), r1=199(y), r2=105(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=194(x), r1=82(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (141, 199) spanning 105 by 34 pixels.
; PLAN: r0=141(x), r1=199(y), r2=105(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 199
LDI r2, 105
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (194, 82) with radius 27.
; PLAN: r0=194(x), r1=82(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 82
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
