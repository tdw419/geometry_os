; DESCRIPTION: Places a red disk with center (221, 190) and radius 58.
; PLAN: r0=221(x), r1=190(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 190
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
