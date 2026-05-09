; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (143, 77) with radius 12. Then Creates a orange rectangular region at (90, 101) spanning 27 by 54 pixels.
; PLAN: r0=143(x), r1=77(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=101(y), r2=27(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (143, 77) with radius 12.
; PLAN: r0=143(x), r1=77(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 77
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (90, 101) spanning 27 by 54 pixels.
; PLAN: r0=90(x), r1=101(y), r2=27(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 101
LDI r2, 27
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
