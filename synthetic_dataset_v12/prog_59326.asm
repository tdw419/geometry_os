; DESCRIPTION: Renders a black box of size 11x75 starting at (419, 103).
; PLAN: r0=419(x), r1=103(y), r2=11(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 103
LDI r2, 11
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
