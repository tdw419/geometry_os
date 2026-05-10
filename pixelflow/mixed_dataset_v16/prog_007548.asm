; DESCRIPTION: Renders a cyan box of size 88x119 starting at (421, 112).
; PLAN: r0=421(x), r1=112(y), r2=88(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 112
LDI r2, 88
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
