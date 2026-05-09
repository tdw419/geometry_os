; DESCRIPTION: Places a white circle of radius 10 at center (175, 27).
; PLAN: r0=175(x), r1=27(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 27
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
