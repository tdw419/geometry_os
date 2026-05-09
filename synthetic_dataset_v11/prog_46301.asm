; DESCRIPTION: Composite: . Then Places a blue circle of radius 50 at center (108, 94). Then Places a yellow dot at position (215, 47).
; PLAN: r0=108(x), r1=94(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=215(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 50 at center (108, 94).
; PLAN: r0=108(x), r1=94(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 94
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (215, 47).
; PLAN: r0=215(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
