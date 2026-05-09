; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (40, 14) spanning 34 by 58 pixels. Then Creates a yellow circular shape at (178, 47) with radius 34.
; PLAN: r0=40(x), r1=14(y), r2=34(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=47(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a purple rectangular region at (40, 14) spanning 34 by 58 pixels.
; PLAN: r0=40(x), r1=14(y), r2=34(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 14
LDI r2, 34
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (178, 47) with radius 34.
; PLAN: r0=178(x), r1=47(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 47
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
