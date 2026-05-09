; DESCRIPTION: Composite: Renders a purple disk with center (74, 67) and radius 42 then Creates a purple rectangular region at (201, 164) spanning 91 by 21 pixels.
; PLAN: r0=74(x), r1=67(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=164(y), r7=91(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 67
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 164
LDI r7, 91
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
