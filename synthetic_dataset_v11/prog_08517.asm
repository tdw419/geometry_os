; DESCRIPTION: Composite: . Then Places a green circle of radius 79 at center (171, 86). Then Places a yellow dot at position (173, 164).
; PLAN: r0=171(x), r1=86(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=173(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 79 at center (171, 86).
; PLAN: r0=171(x), r1=86(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 86
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (173, 164).
; PLAN: r0=173(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
