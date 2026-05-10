; DESCRIPTION: Renders a white box of size 102x100 starting at (366, 102).
; PLAN: r0=366(x), r1=102(y), r2=102(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 102
LDI r2, 102
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
