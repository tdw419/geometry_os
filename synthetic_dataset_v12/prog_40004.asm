; DESCRIPTION: Creates a yellow circular shape at (401, 208) with radius 27.
; PLAN: r0=401(x), r1=208(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 208
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
