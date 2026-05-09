; DESCRIPTION: Composite: . Then Sets a single green pixel at (39, 143). Then Draws a white circle centered at (198, 94) with radius 46.
; PLAN: r0=39(x), r1=143(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=198(x), r1=94(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (39, 143).
; PLAN: r0=39(x), r1=143(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 143
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (198, 94) with radius 46.
; PLAN: r0=198(x), r1=94(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 94
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
