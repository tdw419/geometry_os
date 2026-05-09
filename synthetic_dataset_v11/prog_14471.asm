; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (80, 159) spanning 109 by 64 pixels. Then Creates a blue circular shape at (173, 84) with radius 40.
; PLAN: r0=80(x), r1=159(y), r2=109(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x), r1=84(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (80, 159) spanning 109 by 64 pixels.
; PLAN: r0=80(x), r1=159(y), r2=109(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 159
LDI r2, 109
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (173, 84) with radius 40.
; PLAN: r0=173(x), r1=84(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 84
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
