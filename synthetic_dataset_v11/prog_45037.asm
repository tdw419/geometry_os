; DESCRIPTION: Creates a yellow circular shape at (187, 173) with radius 58.
; PLAN: r0=187(x), r1=173(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 173
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
