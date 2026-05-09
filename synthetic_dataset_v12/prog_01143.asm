; DESCRIPTION: Places a cyan circle of radius 22 at center (329, 70).
; PLAN: r0=329(x), r1=70(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 70
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
