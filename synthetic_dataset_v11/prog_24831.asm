; DESCRIPTION: Composite: . Then Creates a purple circular shape at (55, 125) with radius 15. Then Renders a cyan box of size 88x11 starting at (33, 49).
; PLAN: r0=55(x), r1=125(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=49(y), r2=88(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (55, 125) with radius 15.
; PLAN: r0=55(x), r1=125(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 125
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 88x11 starting at (33, 49).
; PLAN: r0=33(x), r1=49(y), r2=88(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 49
LDI r2, 88
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
