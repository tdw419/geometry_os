; DESCRIPTION: Creates a magenta circular shape at (298, 154) with radius 76.
; PLAN: r0=298(x), r1=154(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 154
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
