; DESCRIPTION: Composite: . Then Places a black dot at position (26, 35). Then Creates a cyan rectangular region at (199, 76) spanning 18 by 60 pixels.
; PLAN: r0=26(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=199(x), r1=76(y), r2=18(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (26, 35).
; PLAN: r0=26(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (199, 76) spanning 18 by 60 pixels.
; PLAN: r0=199(x), r1=76(y), r2=18(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 76
LDI r2, 18
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
