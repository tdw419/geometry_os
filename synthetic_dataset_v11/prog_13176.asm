; DESCRIPTION: Composite: . Then Sets a single orange pixel at (223, 69). Then Draws a white rectangle at (81, 142) with width 111 and height 108.
; PLAN: r0=223(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=142(y), r2=111(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (223, 69).
; PLAN: r0=223(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (81, 142) with width 111 and height 108.
; PLAN: r0=81(x), r1=142(y), r2=111(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 142
LDI r2, 111
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
