; DESCRIPTION: Renders a white box of size 75x100 starting at (96, 24).
; PLAN: r0=96(x), r1=24(y), r2=75(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 24
LDI r2, 75
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
