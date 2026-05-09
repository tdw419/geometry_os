; DESCRIPTION: Renders a green box of size 15x14 starting at (124, 102).
; PLAN: r0=124(x), r1=102(y), r2=15(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 102
LDI r2, 15
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
