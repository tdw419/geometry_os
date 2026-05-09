; DESCRIPTION: Composite: . Then Renders a white box of size 55x93 starting at (108, 155). Then Sets a single black pixel at (33, 254).
; PLAN: r0=108(x), r1=155(y), r2=55(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=33(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 55x93 starting at (108, 155).
; PLAN: r0=108(x), r1=155(y), r2=55(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 155
LDI r2, 55
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (33, 254).
; PLAN: r0=33(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
HALT
