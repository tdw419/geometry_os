; DESCRIPTION: Renders a cyan box of size 88x105 starting at (100, 102).
; PLAN: r0=100(x), r1=102(y), r2=88(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 102
LDI r2, 88
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
