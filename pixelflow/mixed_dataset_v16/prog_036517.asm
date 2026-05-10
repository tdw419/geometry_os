; DESCRIPTION: Places a red disk with center (308, 106) and radius 16.
; PLAN: r0=308(x), r1=106(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 106
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
