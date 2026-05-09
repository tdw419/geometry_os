; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (158, 152) with radius 34. Then Creates a red rectangular region at (4, 10) spanning 107 by 102 pixels.
; PLAN: r0=158(x), r1=152(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=4(x), r1=10(y), r2=107(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (158, 152) with radius 34.
; PLAN: r0=158(x), r1=152(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 152
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (4, 10) spanning 107 by 102 pixels.
; PLAN: r0=4(x), r1=10(y), r2=107(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 107
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
