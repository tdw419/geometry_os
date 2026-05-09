; DESCRIPTION: Composite: . Then Creates a green circular shape at (218, 38) with radius 30. Then Places a magenta dot at position (32, 6).
; PLAN: r0=218(x), r1=38(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (218, 38) with radius 30.
; PLAN: r0=218(x), r1=38(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 38
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (32, 6).
; PLAN: r0=32(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
