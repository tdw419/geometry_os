; DESCRIPTION: Renders a black box of size 28x100 starting at (93, 57).
; PLAN: r0=93(x), r1=57(y), r2=28(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 57
LDI r2, 28
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
