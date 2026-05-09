; DESCRIPTION: Places a blue circle of radius 46 at center (154, 117).
; PLAN: r0=154(x), r1=117(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 117
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
