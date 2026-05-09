; DESCRIPTION: Renders a white box of size 15x120 starting at (115, 100).
; PLAN: r0=115(x), r1=100(y), r2=15(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 100
LDI r2, 15
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
