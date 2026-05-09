; DESCRIPTION: Composite: . Then Places a black dot at position (220, 18). Then Creates a black rectangular region at (153, 56) spanning 98 by 26 pixels.
; PLAN: r0=220(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=56(y), r2=98(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (220, 18).
; PLAN: r0=220(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 18
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (153, 56) spanning 98 by 26 pixels.
; PLAN: r0=153(x), r1=56(y), r2=98(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 56
LDI r2, 98
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
