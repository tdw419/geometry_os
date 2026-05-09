; DESCRIPTION: Composite: . Then Renders a purple box of size 102x85 starting at (98, 104). Then Creates a orange circular shape at (116, 202) with radius 11.
; PLAN: r0=98(x), r1=104(y), r2=102(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=116(x), r1=202(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 102x85 starting at (98, 104).
; PLAN: r0=98(x), r1=104(y), r2=102(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 104
LDI r2, 102
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (116, 202) with radius 11.
; PLAN: r0=116(x), r1=202(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 202
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
