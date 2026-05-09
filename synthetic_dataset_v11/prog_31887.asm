; DESCRIPTION: Composite: . Then Creates a orange circular shape at (162, 172) with radius 29. Then Creates a blue rectangular region at (153, 211) spanning 16 by 37 pixels.
; PLAN: r0=162(x), r1=172(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x), r1=211(y), r2=16(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (162, 172) with radius 29.
; PLAN: r0=162(x), r1=172(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 172
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (153, 211) spanning 16 by 37 pixels.
; PLAN: r0=153(x), r1=211(y), r2=16(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 211
LDI r2, 16
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
