; DESCRIPTION: Places a blue circle of radius 44 at center (228, 149).
; PLAN: r0=228(x), r1=149(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 149
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
