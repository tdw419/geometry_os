; DESCRIPTION: Places a purple circle of radius 50 at center (55, 113).
; PLAN: r0=55(x), r1=113(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 113
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
