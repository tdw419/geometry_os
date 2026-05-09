; DESCRIPTION: Renders a white box of size 75x40 starting at (37, 12).
; PLAN: r0=37(x), r1=12(y), r2=75(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 12
LDI r2, 75
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
