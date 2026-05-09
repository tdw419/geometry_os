; DESCRIPTION: Composite: . Then Places a white dot at position (16, 98). Then Draws a green circle centered at (108, 84) with radius 69.
; PLAN: r0=16(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=84(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (16, 98).
; PLAN: r0=16(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 98
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (108, 84) with radius 69.
; PLAN: r0=108(x), r1=84(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 84
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
