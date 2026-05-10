; DESCRIPTION: Places a white disk with center (123, 127) and radius 70.
; PLAN: r0=123(x), r1=127(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 127
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
