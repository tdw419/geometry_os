; DESCRIPTION: Renders a black box of size 75x93 starting at (178, 40).
; PLAN: r0=178(x), r1=40(y), r2=75(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 40
LDI r2, 75
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
