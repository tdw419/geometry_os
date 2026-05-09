; DESCRIPTION: Composite: . Then Places a green dot at position (59, 72). Then Creates a white circular shape at (166, 181) with radius 64.
; PLAN: r0=59(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=181(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (59, 72).
; PLAN: r0=59(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (166, 181) with radius 64.
; PLAN: r0=166(x), r1=181(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 181
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
