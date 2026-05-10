; DESCRIPTION: Renders a black box of size 90x93 starting at (293, 109).
; PLAN: r0=293(x), r1=109(y), r2=90(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 109
LDI r2, 90
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
