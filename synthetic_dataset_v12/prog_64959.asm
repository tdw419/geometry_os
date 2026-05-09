; DESCRIPTION: Places a white circle of radius 29 at center (328, 209).
; PLAN: r0=328(x), r1=209(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 209
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
