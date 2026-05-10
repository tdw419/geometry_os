; DESCRIPTION: Places a red disk with center (87, 133) and radius 73.
; PLAN: r0=87(x), r1=133(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 133
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
