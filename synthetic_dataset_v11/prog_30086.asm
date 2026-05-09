; DESCRIPTION: Composite: . Then Creates a purple circular shape at (134, 186) with radius 56. Then Renders a magenta box of size 112x71 starting at (45, 150).
; PLAN: r0=134(x), r1=186(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=45(x), r1=150(y), r2=112(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (134, 186) with radius 56.
; PLAN: r0=134(x), r1=186(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 186
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 112x71 starting at (45, 150).
; PLAN: r0=45(x), r1=150(y), r2=112(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 150
LDI r2, 112
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
