; DESCRIPTION: Composite: . Then Places a magenta dot at position (0, 114). Then Places a white circle of radius 15 at center (206, 46).
; PLAN: r0=0(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=206(x), r1=46(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (0, 114).
; PLAN: r0=0(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 15 at center (206, 46).
; PLAN: r0=206(x), r1=46(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 46
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
