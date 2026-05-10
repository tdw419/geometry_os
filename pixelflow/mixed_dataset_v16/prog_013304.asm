; DESCRIPTION: Places a magenta disk with center (391, 170) and radius 72.
; PLAN: r0=391(x), r1=170(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 170
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
