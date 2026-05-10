; DESCRIPTION: Places a cyan circle of radius 74 at center (413, 108).
; PLAN: r0=413(x), r1=108(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 108
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
