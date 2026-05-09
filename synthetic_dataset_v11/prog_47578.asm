; DESCRIPTION: Composite: . Then Places a blue circle of radius 31 at center (82, 113). Then Places a yellow dot at position (75, 28).
; PLAN: r0=82(x), r1=113(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=75(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 31 at center (82, 113).
; PLAN: r0=82(x), r1=113(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 113
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (75, 28).
; PLAN: r0=75(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
