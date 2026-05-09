; DESCRIPTION: Composite: . Then Creates a green circular shape at (72, 113) with radius 31. Then Places a yellow dot at position (229, 209).
; PLAN: r0=72(x), r1=113(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=229(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (72, 113) with radius 31.
; PLAN: r0=72(x), r1=113(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 113
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (229, 209).
; PLAN: r0=229(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
