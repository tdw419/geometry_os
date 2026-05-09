; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (108, 255). Then Creates a yellow rectangular region at (99, 51) spanning 39 by 59 pixels.
; PLAN: r0=108(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=99(x), r1=51(y), r2=39(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (108, 255).
; PLAN: r0=108(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (99, 51) spanning 39 by 59 pixels.
; PLAN: r0=99(x), r1=51(y), r2=39(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 51
LDI r2, 39
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
