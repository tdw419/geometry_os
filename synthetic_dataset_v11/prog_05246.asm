; DESCRIPTION: Composite: . Then Creates a orange circular shape at (28, 227) with radius 17. Then Renders a green box of size 63x95 starting at (12, 120).
; PLAN: r0=28(x), r1=227(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=120(y), r2=63(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (28, 227) with radius 17.
; PLAN: r0=28(x), r1=227(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 227
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 63x95 starting at (12, 120).
; PLAN: r0=12(x), r1=120(y), r2=63(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 120
LDI r2, 63
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
