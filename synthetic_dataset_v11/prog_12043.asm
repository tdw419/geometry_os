; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (66, 15) spanning 116 by 17 pixels. Then Creates a blue circular shape at (196, 120) with radius 26.
; PLAN: r0=66(x), r1=15(y), r2=116(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x), r1=120(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (66, 15) spanning 116 by 17 pixels.
; PLAN: r0=66(x), r1=15(y), r2=116(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 15
LDI r2, 116
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (196, 120) with radius 26.
; PLAN: r0=196(x), r1=120(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 120
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
