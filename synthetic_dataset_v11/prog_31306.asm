; DESCRIPTION: Creates a yellow circular shape at (135, 228) with radius 11.
; PLAN: r0=135(x), r1=228(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 228
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
