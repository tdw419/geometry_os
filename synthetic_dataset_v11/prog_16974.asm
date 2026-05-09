; DESCRIPTION: Composite: . Then Draws a white circle centered at (215, 87) with radius 36. Then Sets a single red pixel at (33, 38).
; PLAN: r0=215(x), r1=87(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (215, 87) with radius 36.
; PLAN: r0=215(x), r1=87(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 87
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (33, 38).
; PLAN: r0=33(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
