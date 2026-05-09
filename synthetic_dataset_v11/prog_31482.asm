; DESCRIPTION: Composite: . Then Creates a orange circular shape at (147, 108) with radius 77. Then Renders a purple box of size 90x79 starting at (53, 160).
; PLAN: r0=147(x), r1=108(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=160(y), r2=90(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (147, 108) with radius 77.
; PLAN: r0=147(x), r1=108(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 108
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 90x79 starting at (53, 160).
; PLAN: r0=53(x), r1=160(y), r2=90(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 160
LDI r2, 90
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
