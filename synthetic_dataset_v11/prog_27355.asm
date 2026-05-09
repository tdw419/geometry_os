; DESCRIPTION: Creates a green circular shape at (59, 202) with radius 24.
; PLAN: r0=59(x), r1=202(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 202
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
