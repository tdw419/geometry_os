; DESCRIPTION: Renders a red circular shape at (57, 124) with radius 28.
; PLAN: r0=57(x), r1=124(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 124
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
