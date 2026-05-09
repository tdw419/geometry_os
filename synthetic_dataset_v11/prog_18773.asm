; DESCRIPTION: Composite: . Then Draws a white circle centered at (116, 38) with radius 25. Then Sets a single cyan pixel at (59, 3).
; PLAN: r0=116(x), r1=38(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=59(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (116, 38) with radius 25.
; PLAN: r0=116(x), r1=38(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 38
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (59, 3).
; PLAN: r0=59(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
