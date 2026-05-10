; DESCRIPTION: Places a red disk with center (376, 162) and radius 28.
; PLAN: r0=376(x), r1=162(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 162
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
