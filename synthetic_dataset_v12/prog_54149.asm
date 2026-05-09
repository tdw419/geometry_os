; DESCRIPTION: Renders a white box of size 75x45 starting at (8, 18).
; PLAN: r0=8(x), r1=18(y), r2=75(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 18
LDI r2, 75
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
