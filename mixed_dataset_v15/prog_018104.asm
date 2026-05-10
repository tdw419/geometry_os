; DESCRIPTION: Places a green circle of radius 60 at center (60, 182).
; PLAN: r0=60(x), r1=182(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 182
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
