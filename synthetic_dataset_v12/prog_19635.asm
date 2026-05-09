; DESCRIPTION: Renders a black box of size 96x23 starting at (214, 175).
; PLAN: r0=214(x), r1=175(y), r2=96(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 175
LDI r2, 96
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
