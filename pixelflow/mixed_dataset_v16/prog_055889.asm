; DESCRIPTION: Renders a white circular shape at (277, 166) with radius 64.
; PLAN: r0=277(x), r1=166(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 166
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
