; DESCRIPTION: Places a red disk with center (108, 131) and radius 57.
; PLAN: r0=108(x), r1=131(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 131
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
