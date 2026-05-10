; DESCRIPTION: Renders a white box of size 43x100 starting at (370, 65).
; PLAN: r0=370(x), r1=65(y), r2=43(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 65
LDI r2, 43
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
