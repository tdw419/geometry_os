; DESCRIPTION: Creates a yellow circular shape at (70, 180) with radius 27.
; PLAN: r0=70(x), r1=180(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 180
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
