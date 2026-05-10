; DESCRIPTION: Draws a green circle centered at (430, 206) with radius 50.
; PLAN: r0=430(x), r1=206(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 206
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
