; DESCRIPTION: Creates a green circular shape at (210, 197) with radius 27.
; PLAN: r0=210(x), r1=197(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 197
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
