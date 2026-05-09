; DESCRIPTION: Composite: . Then Creates a blue circular shape at (172, 117) with radius 67. Then Places a magenta dot at position (55, 174).
; PLAN: r0=172(x), r1=117(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (172, 117) with radius 67.
; PLAN: r0=172(x), r1=117(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 117
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (55, 174).
; PLAN: r0=55(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
