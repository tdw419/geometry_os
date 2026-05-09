; DESCRIPTION: Renders a black box of size 27x22 starting at (458, 145).
; PLAN: r0=458(x), r1=145(y), r2=27(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 145
LDI r2, 27
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
