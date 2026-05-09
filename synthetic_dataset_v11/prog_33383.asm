; DESCRIPTION: Composite: . Then Creates a black circular shape at (149, 67) with radius 19. Then Places a cyan dot at position (59, 235).
; PLAN: r0=149(x), r1=67(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=59(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (149, 67) with radius 19.
; PLAN: r0=149(x), r1=67(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 67
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (59, 235).
; PLAN: r0=59(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 235
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
