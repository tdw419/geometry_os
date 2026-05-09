; DESCRIPTION: Places a blue circle of radius 76 at center (154, 127).
; PLAN: r0=154(x), r1=127(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 127
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
