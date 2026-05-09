; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (151, 201) with radius 32. Then Creates a cyan rectangular region at (219, 22) spanning 15 by 57 pixels.
; PLAN: r0=151(x), r1=201(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=219(x), r1=22(y), r2=15(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (151, 201) with radius 32.
; PLAN: r0=151(x), r1=201(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 201
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (219, 22) spanning 15 by 57 pixels.
; PLAN: r0=219(x), r1=22(y), r2=15(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 22
LDI r2, 15
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
