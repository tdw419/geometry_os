; DESCRIPTION: Composite: . Then Draws a white circle centered at (116, 151) with radius 59. Then Places a red dot at position (248, 26).
; PLAN: r0=116(x), r1=151(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (116, 151) with radius 59.
; PLAN: r0=116(x), r1=151(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 151
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (248, 26).
; PLAN: r0=248(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
