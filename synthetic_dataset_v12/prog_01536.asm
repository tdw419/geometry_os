; DESCRIPTION: Renders a black box of size 101x70 starting at (45, 171).
; PLAN: r0=45(x), r1=171(y), r2=101(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 171
LDI r2, 101
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
