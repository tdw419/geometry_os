; DESCRIPTION: Places a red circle of radius 16 at center (338, 178).
; PLAN: r0=338(x), r1=178(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 178
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
