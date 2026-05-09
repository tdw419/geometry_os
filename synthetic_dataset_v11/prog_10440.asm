; DESCRIPTION: Composite: . Then Renders a white box of size 68x11 starting at (108, 56). Then Creates a yellow circular shape at (179, 90) with radius 59.
; PLAN: r0=108(x), r1=56(y), r2=68(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=90(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 68x11 starting at (108, 56).
; PLAN: r0=108(x), r1=56(y), r2=68(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 56
LDI r2, 68
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (179, 90) with radius 59.
; PLAN: r0=179(x), r1=90(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 90
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
