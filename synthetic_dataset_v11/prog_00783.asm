; DESCRIPTION: Draws a blue circle centered at (234, 215) with radius 16.
; PLAN: r0=234(x), r1=215(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 215
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
