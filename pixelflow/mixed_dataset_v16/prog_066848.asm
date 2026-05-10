; DESCRIPTION: Renders a white box of size 45x10 starting at (372, 121).
; PLAN: r0=372(x), r1=121(y), r2=45(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 121
LDI r2, 45
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
