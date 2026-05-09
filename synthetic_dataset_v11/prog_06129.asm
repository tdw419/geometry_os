; DESCRIPTION: Composite: . Then Places a yellow circle of radius 67 at center (125, 79). Then Places a cyan dot at position (250, 56).
; PLAN: r0=125(x), r1=79(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=250(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 67 at center (125, 79).
; PLAN: r0=125(x), r1=79(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 79
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (250, 56).
; PLAN: r0=250(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
