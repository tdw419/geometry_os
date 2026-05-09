; DESCRIPTION: Creates a green circular shape at (446, 74) with radius 55.
; PLAN: r0=446(x), r1=74(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 74
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
