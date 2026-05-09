; DESCRIPTION: Draws a cyan circle centered at (405, 117) with radius 24.
; PLAN: r0=405(x), r1=117(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 117
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
