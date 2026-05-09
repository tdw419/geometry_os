; DESCRIPTION: Places a yellow circle of radius 69 at center (74, 113).
; PLAN: r0=74(x), r1=113(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 113
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
