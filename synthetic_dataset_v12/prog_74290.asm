; DESCRIPTION: Places a cyan circle of radius 70 at center (254, 100).
; PLAN: r0=254(x), r1=100(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 100
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
