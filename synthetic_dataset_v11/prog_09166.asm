; DESCRIPTION: Renders a white box of size 35x38 starting at (2, 177).
; PLAN: r0=2(x), r1=177(y), r2=35(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 177
LDI r2, 35
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
