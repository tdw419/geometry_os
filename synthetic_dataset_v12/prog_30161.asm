; DESCRIPTION: Renders a cyan box of size 88x98 starting at (163, 98).
; PLAN: r0=163(x), r1=98(y), r2=88(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 98
LDI r2, 88
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
