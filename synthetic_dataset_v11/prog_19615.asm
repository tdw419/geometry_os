; DESCRIPTION: Composite: . Then Places a magenta circle of radius 46 at center (110, 171). Then Creates a yellow rectangular region at (96, 52) spanning 58 by 26 pixels.
; PLAN: r0=110(x), r1=171(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x), r1=52(y), r2=58(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 46 at center (110, 171).
; PLAN: r0=110(x), r1=171(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 171
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a yellow rectangular region at (96, 52) spanning 58 by 26 pixels.
; PLAN: r0=96(x), r1=52(y), r2=58(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 52
LDI r2, 58
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
