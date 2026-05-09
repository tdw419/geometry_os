; DESCRIPTION: Renders a black box of size 18x103 starting at (20, 131).
; PLAN: r0=20(x), r1=131(y), r2=18(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 131
LDI r2, 18
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
