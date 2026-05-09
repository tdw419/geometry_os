; DESCRIPTION: Places a black circle of radius 76 at center (106, 113).
; PLAN: r0=106(x), r1=113(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 113
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
