; DESCRIPTION: Composite: . Then Sets a single green pixel at (173, 115). Then Draws a white circle centered at (151, 59) with radius 47.
; PLAN: r0=173(x), r1=115(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=151(x), r1=59(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (173, 115).
; PLAN: r0=173(x), r1=115(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 115
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (151, 59) with radius 47.
; PLAN: r0=151(x), r1=59(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 59
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
