; DESCRIPTION: Places a cyan circle of radius 46 at center (265, 123).
; PLAN: r0=265(x), r1=123(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 123
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
