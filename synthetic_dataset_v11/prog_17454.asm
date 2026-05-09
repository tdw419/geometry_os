; DESCRIPTION: Composite: . Then Places a orange circle of radius 46 at center (165, 127). Then Creates a green rectangular region at (241, 150) spanning 14 by 58 pixels.
; PLAN: r0=165(x), r1=127(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x), r1=150(y), r2=14(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 46 at center (165, 127).
; PLAN: r0=165(x), r1=127(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 127
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (241, 150) spanning 14 by 58 pixels.
; PLAN: r0=241(x), r1=150(y), r2=14(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 150
LDI r2, 14
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
