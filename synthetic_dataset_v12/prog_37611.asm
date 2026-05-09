; DESCRIPTION: Places a purple circle of radius 46 at center (275, 113).
; PLAN: r0=275(x), r1=113(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 113
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
