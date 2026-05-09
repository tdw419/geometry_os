; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (12, 103) spanning 94 by 54 pixels. Then Creates a yellow circular shape at (226, 62) with radius 14.
; PLAN: r0=12(x), r1=103(y), r2=94(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x), r1=62(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (12, 103) spanning 94 by 54 pixels.
; PLAN: r0=12(x), r1=103(y), r2=94(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 103
LDI r2, 94
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (226, 62) with radius 14.
; PLAN: r0=226(x), r1=62(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 62
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
