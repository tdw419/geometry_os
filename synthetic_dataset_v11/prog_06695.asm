; DESCRIPTION: Renders a green box of size 95x96 starting at (161, 31).
; PLAN: r0=161(x), r1=31(y), r2=95(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 31
LDI r2, 95
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
