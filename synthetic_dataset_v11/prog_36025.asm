; DESCRIPTION: Composite: . Then Creates a red circular shape at (68, 147) with radius 61. Then Creates a cyan rectangular region at (41, 189) spanning 17 by 47 pixels.
; PLAN: r0=68(x), r1=147(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=41(x), r1=189(y), r2=17(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (68, 147) with radius 61.
; PLAN: r0=68(x), r1=147(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 147
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (41, 189) spanning 17 by 47 pixels.
; PLAN: r0=41(x), r1=189(y), r2=17(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 189
LDI r2, 17
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
