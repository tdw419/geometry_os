; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (75, 175) with radius 61. Then Creates a cyan rectangular region at (184, 52) spanning 26 by 92 pixels.
; PLAN: r0=75(x), r1=175(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=184(x), r1=52(y), r2=26(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (75, 175) with radius 61.
; PLAN: r0=75(x), r1=175(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 175
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (184, 52) spanning 26 by 92 pixels.
; PLAN: r0=184(x), r1=52(y), r2=26(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 52
LDI r2, 26
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
