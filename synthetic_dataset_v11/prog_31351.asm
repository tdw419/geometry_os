; DESCRIPTION: Composite: . Then Creates a red rectangular region at (102, 72) spanning 90 by 115 pixels. Then Creates a purple circular shape at (175, 186) with radius 26.
; PLAN: r0=102(x), r1=72(y), r2=90(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=186(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (102, 72) spanning 90 by 115 pixels.
; PLAN: r0=102(x), r1=72(y), r2=90(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 72
LDI r2, 90
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (175, 186) with radius 26.
; PLAN: r0=175(x), r1=186(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 186
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
