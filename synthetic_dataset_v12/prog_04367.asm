; DESCRIPTION: Places a blue circle of radius 43 at center (384, 95).
; PLAN: r0=384(x), r1=95(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 95
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
