; DESCRIPTION: Renders a white box of size 105x21 starting at (86, 35).
; PLAN: r0=86(x), r1=35(y), r2=105(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 35
LDI r2, 105
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
