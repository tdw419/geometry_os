; DESCRIPTION: Places a yellow circle of radius 71 at center (182, 113).
; PLAN: r0=182(x), r1=113(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 113
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
