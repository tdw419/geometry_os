; DESCRIPTION: Renders a white box of size 89x119 starting at (262, 50).
; PLAN: r0=262(x), r1=50(y), r2=89(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 50
LDI r2, 89
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
