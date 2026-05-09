; DESCRIPTION: Renders a cyan box of size 88x91 starting at (138, 119).
; PLAN: r0=138(x), r1=119(y), r2=88(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 119
LDI r2, 88
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
