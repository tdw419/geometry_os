; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (214, 66) with radius 34. Then Places a green dot at position (71, 128).
; PLAN: r0=214(x), r1=66(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=71(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (214, 66) with radius 34.
; PLAN: r0=214(x), r1=66(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 66
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (71, 128).
; PLAN: r0=71(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
