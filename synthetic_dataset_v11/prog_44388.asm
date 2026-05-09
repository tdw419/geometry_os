; DESCRIPTION: Places a white circle of radius 64 at center (183, 113).
; PLAN: r0=183(x), r1=113(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 113
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
