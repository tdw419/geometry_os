; DESCRIPTION: Places a red disk with center (294, 165) and radius 17.
; PLAN: r0=294(x), r1=165(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 165
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
