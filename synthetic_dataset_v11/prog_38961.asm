; DESCRIPTION: Composite: . Then Creates a red circular shape at (147, 227) with radius 12. Then Draws a purple rectangle at (189, 174) with width 12 and height 47.
; PLAN: r0=147(x), r1=227(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=189(x), r1=174(y), r2=12(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (147, 227) with radius 12.
; PLAN: r0=147(x), r1=227(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 227
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (189, 174) with width 12 and height 47.
; PLAN: r0=189(x), r1=174(y), r2=12(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 174
LDI r2, 12
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
