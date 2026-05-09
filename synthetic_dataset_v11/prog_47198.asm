; DESCRIPTION: Composite: . Then Creates a purple circular shape at (80, 36) with radius 26. Then Creates a orange rectangular region at (79, 126) spanning 91 by 110 pixels.
; PLAN: r0=80(x), r1=36(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x), r1=126(y), r2=91(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (80, 36) with radius 26.
; PLAN: r0=80(x), r1=36(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 36
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (79, 126) spanning 91 by 110 pixels.
; PLAN: r0=79(x), r1=126(y), r2=91(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 126
LDI r2, 91
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
