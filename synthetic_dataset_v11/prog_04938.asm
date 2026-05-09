; DESCRIPTION: Composite: . Then Places a black dot at position (159, 1). Then Creates a cyan rectangular region at (108, 126) spanning 62 by 80 pixels.
; PLAN: r0=159(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=126(y), r2=62(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (159, 1).
; PLAN: r0=159(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (108, 126) spanning 62 by 80 pixels.
; PLAN: r0=108(x), r1=126(y), r2=62(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 126
LDI r2, 62
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
