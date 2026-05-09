; DESCRIPTION: Places a blue circle of radius 28 at center (127, 113).
; PLAN: r0=127(x), r1=113(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 113
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
