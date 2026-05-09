; DESCRIPTION: Draws a black circle centered at (103, 231) with radius 24.
; PLAN: r0=103(x), r1=231(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 231
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
