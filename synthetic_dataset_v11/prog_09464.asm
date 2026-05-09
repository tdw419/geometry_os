; DESCRIPTION: Composite: . Then Places a black circle of radius 43 at center (104, 177). Then Creates a black rectangular region at (148, 89) spanning 36 by 106 pixels.
; PLAN: r0=104(x), r1=177(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=148(x), r1=89(y), r2=36(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 43 at center (104, 177).
; PLAN: r0=104(x), r1=177(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 177
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a black rectangular region at (148, 89) spanning 36 by 106 pixels.
; PLAN: r0=148(x), r1=89(y), r2=36(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 89
LDI r2, 36
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
