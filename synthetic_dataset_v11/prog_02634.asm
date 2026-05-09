; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (116, 56) with radius 39. Then Places a green dot at position (187, 36).
; PLAN: r0=116(x), r1=56(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=187(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (116, 56) with radius 39.
; PLAN: r0=116(x), r1=56(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 56
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (187, 36).
; PLAN: r0=187(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
