; DESCRIPTION: Renders a black box of size 24x120 starting at (120, 4).
; PLAN: r0=120(x), r1=4(y), r2=24(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 4
LDI r2, 24
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
