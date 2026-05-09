; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (11, 187) spanning 92 by 44 pixels. Then Creates a black circular shape at (234, 69) with radius 12.
; PLAN: r0=11(x), r1=187(y), r2=92(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=69(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (11, 187) spanning 92 by 44 pixels.
; PLAN: r0=11(x), r1=187(y), r2=92(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 187
LDI r2, 92
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (234, 69) with radius 12.
; PLAN: r0=234(x), r1=69(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 69
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
