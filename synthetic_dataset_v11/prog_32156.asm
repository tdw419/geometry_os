; DESCRIPTION: Places a black circle of radius 45 at center (180, 121).
; PLAN: r0=180(x), r1=121(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 121
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
