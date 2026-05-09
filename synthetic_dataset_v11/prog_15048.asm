; DESCRIPTION: Composite: . Then Sets a single red pixel at (249, 223). Then Creates a black rectangular region at (10, 103) spanning 13 by 43 pixels.
; PLAN: r0=249(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=10(x), r1=103(y), r2=13(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (249, 223).
; PLAN: r0=249(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (10, 103) spanning 13 by 43 pixels.
; PLAN: r0=10(x), r1=103(y), r2=13(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 103
LDI r2, 13
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
