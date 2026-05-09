; DESCRIPTION: Composite: . Then Renders a purple box of size 96x38 starting at (118, 206). Then Creates a blue circular shape at (141, 154) with radius 70.
; PLAN: r0=118(x), r1=206(y), r2=96(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=141(x), r1=154(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 96x38 starting at (118, 206).
; PLAN: r0=118(x), r1=206(y), r2=96(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 206
LDI r2, 96
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (141, 154) with radius 70.
; PLAN: r0=141(x), r1=154(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 154
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
