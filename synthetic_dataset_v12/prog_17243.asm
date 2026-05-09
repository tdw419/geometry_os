; DESCRIPTION: Places a blue circle of radius 41 at center (415, 204).
; PLAN: r0=415(x), r1=204(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 204
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
