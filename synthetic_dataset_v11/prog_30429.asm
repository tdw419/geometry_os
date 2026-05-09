; DESCRIPTION: Places a cyan circle of radius 19 at center (108, 206).
; PLAN: r0=108(x), r1=206(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 206
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
