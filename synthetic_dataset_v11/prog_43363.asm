; DESCRIPTION: Places a cyan circle of radius 46 at center (182, 134).
; PLAN: r0=182(x), r1=134(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 134
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
