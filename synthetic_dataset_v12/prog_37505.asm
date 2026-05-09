; DESCRIPTION: Renders a black box of size 29x48 starting at (85, 27).
; PLAN: r0=85(x), r1=27(y), r2=29(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 27
LDI r2, 29
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
