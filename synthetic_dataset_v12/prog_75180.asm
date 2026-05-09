; DESCRIPTION: Renders a black box of size 96x55 starting at (376, 131).
; PLAN: r0=376(x), r1=131(y), r2=96(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 131
LDI r2, 96
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
