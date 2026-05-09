; DESCRIPTION: Composite: . Then Places a red dot at position (155, 26). Then Creates a green rectangular region at (108, 2) spanning 77 by 60 pixels.
; PLAN: r0=155(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=2(y), r2=77(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (155, 26).
; PLAN: r0=155(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (108, 2) spanning 77 by 60 pixels.
; PLAN: r0=108(x), r1=2(y), r2=77(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 2
LDI r2, 77
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
