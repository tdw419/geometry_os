; DESCRIPTION: Composite: . Then Creates a red circular shape at (54, 108) with radius 52. Then Renders a green box of size 120x35 starting at (25, 56).
; PLAN: r0=54(x), r1=108(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=25(x), r1=56(y), r2=120(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (54, 108) with radius 52.
; PLAN: r0=54(x), r1=108(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 108
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 120x35 starting at (25, 56).
; PLAN: r0=25(x), r1=56(y), r2=120(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 56
LDI r2, 120
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
