; DESCRIPTION: Composite: . Then Creates a white circular shape at (104, 169) with radius 54. Then Places a magenta dot at position (210, 90).
; PLAN: r0=104(x), r1=169(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=210(x), r1=90(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (104, 169) with radius 54.
; PLAN: r0=104(x), r1=169(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 169
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (210, 90).
; PLAN: r0=210(x), r1=90(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 90
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
