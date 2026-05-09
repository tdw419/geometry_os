; DESCRIPTION: Creates a cyan circular shape at (159, 127) with radius 27.
; PLAN: r0=159(x), r1=127(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 127
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
