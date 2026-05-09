; DESCRIPTION: Creates a yellow circular shape at (306, 167) with radius 48.
; PLAN: r0=306(x), r1=167(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 167
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
