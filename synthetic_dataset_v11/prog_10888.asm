; DESCRIPTION: Creates a white circular shape at (106, 74) with radius 46.
; PLAN: r0=106(x), r1=74(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 74
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
