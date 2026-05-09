; DESCRIPTION: Renders a black box of size 85x66 starting at (82, 24).
; PLAN: r0=82(x), r1=24(y), r2=85(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 24
LDI r2, 85
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
