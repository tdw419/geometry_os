; DESCRIPTION: Composite: . Then Places a yellow circle of radius 59 at center (74, 64). Then Sets a single cyan pixel at (166, 143).
; PLAN: r0=74(x), r1=64(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=166(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 59 at center (74, 64).
; PLAN: r0=74(x), r1=64(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 64
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (166, 143).
; PLAN: r0=166(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
