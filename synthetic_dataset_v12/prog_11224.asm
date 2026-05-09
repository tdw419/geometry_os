; DESCRIPTION: Places a red circle of radius 45 at center (375, 171).
; PLAN: r0=375(x), r1=171(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 171
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
