; DESCRIPTION: Draws a green circle centered at (277, 173) with radius 76.
; PLAN: r0=277(x), r1=173(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 173
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
