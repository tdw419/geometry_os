; DESCRIPTION: Draws a cyan circle centered at (256, 103) with radius 80.
; PLAN: r0=256(x), r1=103(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 103
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
