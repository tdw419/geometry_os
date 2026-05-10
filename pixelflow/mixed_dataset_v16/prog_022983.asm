; DESCRIPTION: Creates a yellow circular shape at (380, 164) with radius 25.
; PLAN: r0=380(x), r1=164(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 164
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
