; DESCRIPTION: Places a white circle of radius 54 at center (144, 166).
; PLAN: r0=144(x), r1=166(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 166
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
