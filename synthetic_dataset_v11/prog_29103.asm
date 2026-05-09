; DESCRIPTION: Composite: . Then Creates a orange circular shape at (81, 179) with radius 35. Then Creates a green rectangular region at (80, 84) spanning 71 by 10 pixels.
; PLAN: r0=81(x), r1=179(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=80(x), r1=84(y), r2=71(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (81, 179) with radius 35.
; PLAN: r0=81(x), r1=179(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 179
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (80, 84) spanning 71 by 10 pixels.
; PLAN: r0=80(x), r1=84(y), r2=71(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 84
LDI r2, 71
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
