; DESCRIPTION: Composite: . Then Renders a purple box of size 75x33 starting at (73, 56). Then Creates a orange circular shape at (174, 126) with radius 15.
; PLAN: r0=73(x), r1=56(y), r2=75(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=174(x), r1=126(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 75x33 starting at (73, 56).
; PLAN: r0=73(x), r1=56(y), r2=75(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 56
LDI r2, 75
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (174, 126) with radius 15.
; PLAN: r0=174(x), r1=126(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 126
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
