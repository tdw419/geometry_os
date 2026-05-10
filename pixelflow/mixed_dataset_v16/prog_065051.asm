; DESCRIPTION: Creates a red circular shape at (59, 135) with radius 54.
; PLAN: r0=59(x), r1=135(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 135
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
