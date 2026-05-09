; DESCRIPTION: Composite: . Then Creates a orange circular shape at (83, 154) with radius 78. Then Renders a purple box of size 109x38 starting at (67, 174).
; PLAN: r0=83(x), r1=154(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=174(y), r2=109(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (83, 154) with radius 78.
; PLAN: r0=83(x), r1=154(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 154
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 109x38 starting at (67, 174).
; PLAN: r0=67(x), r1=174(y), r2=109(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 174
LDI r2, 109
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
