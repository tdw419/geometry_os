; DESCRIPTION: Renders a cyan box of size 35x88 starting at (161, 40).
; PLAN: r0=161(x), r1=40(y), r2=35(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 40
LDI r2, 35
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
