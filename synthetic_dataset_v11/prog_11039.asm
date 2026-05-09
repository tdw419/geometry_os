; DESCRIPTION: Composite: . Then Places a blue dot at position (241, 58). Then Creates a black rectangular region at (68, 82) spanning 10 by 90 pixels.
; PLAN: r0=241(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=68(x), r1=82(y), r2=10(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (241, 58).
; PLAN: r0=241(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (68, 82) spanning 10 by 90 pixels.
; PLAN: r0=68(x), r1=82(y), r2=10(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 82
LDI r2, 10
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
