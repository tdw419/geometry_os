; DESCRIPTION: Renders a black box of size 100x85 starting at (80, 107).
; PLAN: r0=80(x), r1=107(y), r2=100(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 107
LDI r2, 100
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
