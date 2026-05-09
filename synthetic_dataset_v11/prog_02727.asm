; DESCRIPTION: Composite: . Then Creates a orange circular shape at (138, 132) with radius 65. Then Creates a green rectangular region at (135, 211) spanning 43 by 25 pixels.
; PLAN: r0=138(x), r1=132(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x), r1=211(y), r2=43(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (138, 132) with radius 65.
; PLAN: r0=138(x), r1=132(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 132
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (135, 211) spanning 43 by 25 pixels.
; PLAN: r0=135(x), r1=211(y), r2=43(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 211
LDI r2, 43
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
