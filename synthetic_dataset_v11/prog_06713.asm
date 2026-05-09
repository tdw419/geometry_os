; DESCRIPTION: Places a black circle of radius 59 at center (144, 113).
; PLAN: r0=144(x), r1=113(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 113
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
