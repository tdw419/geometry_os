; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (59, 70) with radius 33. Then Places a yellow dot at position (19, 225).
; PLAN: r0=59(x), r1=70(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (59, 70) with radius 33.
; PLAN: r0=59(x), r1=70(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 70
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (19, 225).
; PLAN: r0=19(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
