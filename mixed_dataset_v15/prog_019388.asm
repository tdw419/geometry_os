; DESCRIPTION: Places a red disk with center (276, 164) and radius 12.
; PLAN: r0=276(x), r1=164(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 164
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
