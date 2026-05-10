; DESCRIPTION: Places a red disk with center (317, 53) and radius 57.
; PLAN: r0=317(x), r1=53(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 53
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
