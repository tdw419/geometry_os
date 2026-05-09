; DESCRIPTION: Creates a red circular shape at (108, 209) with radius 14.
; PLAN: r0=108(x), r1=209(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 209
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
