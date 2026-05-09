; DESCRIPTION: Renders a black box of size 30x27 starting at (481, 39).
; PLAN: r0=481(x), r1=39(y), r2=30(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 39
LDI r2, 30
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
