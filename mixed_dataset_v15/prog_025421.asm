; DESCRIPTION: Draws a cyan circle centered at (209, 134) with radius 52.
; PLAN: r0=209(x), r1=134(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 134
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
