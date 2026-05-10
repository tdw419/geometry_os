; DESCRIPTION: Renders a green box of size 70x96 starting at (269, 1).
; PLAN: r0=269(x), r1=1(y), r2=70(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 1
LDI r2, 70
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
