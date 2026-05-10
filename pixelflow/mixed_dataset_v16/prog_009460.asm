; DESCRIPTION: Draws a blue circle centered at (234, 228) with radius 11.
; PLAN: r0=234(x), r1=228(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 228
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
