; DESCRIPTION: Composite: . Then Renders a orange disk with center (99, 161) and radius 42. Then Creates a purple rectangular region at (56, 104) spanning 68 by 81 pixels.
; PLAN: r0=99(x), r1=161(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=56(x), r1=104(y), r2=68(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (99, 161) and radius 42.
; PLAN: r0=99(x), r1=161(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 161
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (56, 104) spanning 68 by 81 pixels.
; PLAN: r0=56(x), r1=104(y), r2=68(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 104
LDI r2, 68
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
