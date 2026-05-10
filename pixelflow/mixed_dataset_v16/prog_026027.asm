; DESCRIPTION: Places a cyan circle of radius 69 at center (180, 119).
; PLAN: r0=180(x), r1=119(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 119
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
