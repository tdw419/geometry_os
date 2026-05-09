; DESCRIPTION: Renders a green box of size 35x102 starting at (39, 15).
; PLAN: r0=39(x), r1=15(y), r2=35(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 15
LDI r2, 35
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
