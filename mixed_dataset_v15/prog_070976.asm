; DESCRIPTION: Places a blue disk with center (154, 195) and radius 44.
; PLAN: r0=154(x), r1=195(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 195
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
