; DESCRIPTION: Composite: . Then Renders a red box of size 120x65 starting at (119, 77). Then Creates a yellow circular shape at (206, 138) with radius 43.
; PLAN: r0=119(x), r1=77(y), r2=120(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=206(x), r1=138(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 120x65 starting at (119, 77).
; PLAN: r0=119(x), r1=77(y), r2=120(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 77
LDI r2, 120
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (206, 138) with radius 43.
; PLAN: r0=206(x), r1=138(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 138
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
