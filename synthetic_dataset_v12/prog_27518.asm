; DESCRIPTION: Creates a black circular shape at (401, 177) with radius 46.
; PLAN: r0=401(x), r1=177(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 177
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
