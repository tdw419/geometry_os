; DESCRIPTION: Composite: . Then Creates a black rectangular region at (85, 136) spanning 16 by 51 pixels. Then Sets a single white pixel at (204, 221).
; PLAN: r0=85(x), r1=136(y), r2=16(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=204(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (85, 136) spanning 16 by 51 pixels.
; PLAN: r0=85(x), r1=136(y), r2=16(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 136
LDI r2, 16
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (204, 221).
; PLAN: r0=204(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
