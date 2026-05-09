; DESCRIPTION: Composite: . Then Renders a red box of size 116x85 starting at (52, 92). Then Creates a green circular shape at (154, 78) with radius 59.
; PLAN: r0=52(x), r1=92(y), r2=116(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x), r1=78(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 116x85 starting at (52, 92).
; PLAN: r0=52(x), r1=92(y), r2=116(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 92
LDI r2, 116
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (154, 78) with radius 59.
; PLAN: r0=154(x), r1=78(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 78
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
