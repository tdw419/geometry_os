; DESCRIPTION: Creates a yellow circular shape at (113, 177) with radius 68.
; PLAN: r0=113(x), r1=177(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 177
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
