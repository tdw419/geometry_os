; DESCRIPTION: Renders a green box of size 20x49 starting at (86, 165).
; PLAN: r0=86(x), r1=165(y), r2=20(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 165
LDI r2, 20
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
