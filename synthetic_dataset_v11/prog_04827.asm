; DESCRIPTION: Places a red circle of radius 26 at center (64, 174).
; PLAN: r0=64(x), r1=174(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 174
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
