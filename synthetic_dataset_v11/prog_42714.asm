; DESCRIPTION: Composite: . Then Creates a red rectangular region at (141, 6) spanning 73 by 99 pixels. Then Creates a cyan circular shape at (131, 174) with radius 69.
; PLAN: r0=141(x), r1=6(y), r2=73(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x), r1=174(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (141, 6) spanning 73 by 99 pixels.
; PLAN: r0=141(x), r1=6(y), r2=73(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 6
LDI r2, 73
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (131, 174) with radius 69.
; PLAN: r0=131(x), r1=174(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 174
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
