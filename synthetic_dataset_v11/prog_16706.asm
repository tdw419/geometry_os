; DESCRIPTION: Composite: . Then Places a yellow dot at position (255, 194). Then Creates a black rectangular region at (47, 177) spanning 30 by 61 pixels.
; PLAN: r0=255(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=47(x), r1=177(y), r2=30(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (255, 194).
; PLAN: r0=255(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (47, 177) spanning 30 by 61 pixels.
; PLAN: r0=47(x), r1=177(y), r2=30(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 177
LDI r2, 30
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
