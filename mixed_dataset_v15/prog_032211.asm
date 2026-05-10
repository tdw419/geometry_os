; DESCRIPTION: Places a purple circle of radius 58 at center (309, 113).
; PLAN: r0=309(x), r1=113(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 113
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
