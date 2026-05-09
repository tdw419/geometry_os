; DESCRIPTION: Composite: . Then Places a black dot at position (76, 180). Then Creates a white rectangular region at (161, 17) spanning 62 by 25 pixels.
; PLAN: r0=76(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=161(x), r1=17(y), r2=62(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (76, 180).
; PLAN: r0=76(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (161, 17) spanning 62 by 25 pixels.
; PLAN: r0=161(x), r1=17(y), r2=62(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 17
LDI r2, 62
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
