; DESCRIPTION: Creates a yellow circular shape at (298, 70) with radius 34.
; PLAN: r0=298(x), r1=70(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 70
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
