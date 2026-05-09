; DESCRIPTION: Composite: . Then Places a white dot at position (244, 159). Then Draws a blue circle centered at (146, 171) with radius 72.
; PLAN: r0=244(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=146(x), r1=171(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (244, 159).
; PLAN: r0=244(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (146, 171) with radius 72.
; PLAN: r0=146(x), r1=171(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 171
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
