; DESCRIPTION: Composite: . Then Places a red dot at position (31, 18). Then Creates a red rectangular region at (62, 5) spanning 14 by 14 pixels.
; PLAN: r0=31(x), r1=18(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=5(y), r2=14(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (31, 18).
; PLAN: r0=31(x), r1=18(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 18
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (62, 5) spanning 14 by 14 pixels.
; PLAN: r0=62(x), r1=5(y), r2=14(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 5
LDI r2, 14
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
