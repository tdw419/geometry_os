; DESCRIPTION: Composite: . Then Draws a green circle centered at (205, 179) with radius 33. Then Renders a black box of size 116x87 starting at (54, 160).
; PLAN: r0=205(x), r1=179(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=160(y), r2=116(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (205, 179) with radius 33.
; PLAN: r0=205(x), r1=179(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 179
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 116x87 starting at (54, 160).
; PLAN: r0=54(x), r1=160(y), r2=116(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 160
LDI r2, 116
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
