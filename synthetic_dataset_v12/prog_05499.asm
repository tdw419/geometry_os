; DESCRIPTION: Places a red circle of radius 15 at center (460, 103).
; PLAN: r0=460(x), r1=103(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 103
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
