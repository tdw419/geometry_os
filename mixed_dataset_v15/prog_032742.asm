; DESCRIPTION: Renders a white box of size 60x32 starting at (375, 9).
; PLAN: r0=375(x), r1=9(y), r2=60(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 9
LDI r2, 60
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
