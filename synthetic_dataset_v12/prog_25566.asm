; DESCRIPTION: Creates a cyan circular shape at (391, 184) with radius 67.
; PLAN: r0=391(x), r1=184(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 184
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
