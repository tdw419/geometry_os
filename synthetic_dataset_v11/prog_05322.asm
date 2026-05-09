; DESCRIPTION: Composite: . Then Draws a white circle centered at (151, 29) with radius 27. Then Places a cyan dot at position (116, 121).
; PLAN: r0=151(x), r1=29(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (151, 29) with radius 27.
; PLAN: r0=151(x), r1=29(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 29
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (116, 121).
; PLAN: r0=116(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
