; DESCRIPTION: Places a cyan circle of radius 51 at center (424, 55).
; PLAN: r0=424(x), r1=55(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 55
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
