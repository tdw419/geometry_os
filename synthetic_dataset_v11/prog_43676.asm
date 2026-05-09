; DESCRIPTION: Composite: . Then Places a cyan dot at position (171, 245). Then Creates a magenta rectangular region at (17, 166) spanning 38 by 83 pixels.
; PLAN: r0=171(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=17(x), r1=166(y), r2=38(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (171, 245).
; PLAN: r0=171(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (17, 166) spanning 38 by 83 pixels.
; PLAN: r0=17(x), r1=166(y), r2=38(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 166
LDI r2, 38
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
