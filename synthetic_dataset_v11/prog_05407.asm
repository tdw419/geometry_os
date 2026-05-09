; DESCRIPTION: Composite: . Then Places a purple dot at position (28, 69). Then Creates a orange rectangular region at (10, 122) spanning 103 by 112 pixels.
; PLAN: r0=28(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=10(x), r1=122(y), r2=103(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (28, 69).
; PLAN: r0=28(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (10, 122) spanning 103 by 112 pixels.
; PLAN: r0=10(x), r1=122(y), r2=103(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 122
LDI r2, 103
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
