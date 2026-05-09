; DESCRIPTION: Renders a white box of size 101x60 starting at (98, 22).
; PLAN: r0=98(x), r1=22(y), r2=101(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 22
LDI r2, 101
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
