; DESCRIPTION: Composite: . Then Places a cyan dot at position (103, 138). Then Creates a green circular shape at (127, 86) with radius 48.
; PLAN: r0=103(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=127(x), r1=86(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (103, 138).
; PLAN: r0=103(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (127, 86) with radius 48.
; PLAN: r0=127(x), r1=86(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 86
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
