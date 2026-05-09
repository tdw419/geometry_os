; DESCRIPTION: Draws a cyan circle centered at (409, 117) with radius 27.
; PLAN: r0=409(x), r1=117(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 117
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
