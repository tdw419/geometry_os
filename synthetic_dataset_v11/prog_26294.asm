; DESCRIPTION: Composite: . Then Creates a purple circular shape at (54, 232) with radius 12. Then Renders a red box of size 50x52 starting at (8, 198).
; PLAN: r0=54(x), r1=232(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=198(y), r2=50(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (54, 232) with radius 12.
; PLAN: r0=54(x), r1=232(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 232
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 50x52 starting at (8, 198).
; PLAN: r0=8(x), r1=198(y), r2=50(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 198
LDI r2, 50
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
