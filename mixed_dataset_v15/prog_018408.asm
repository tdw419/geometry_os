; DESCRIPTION: Renders a white box of size 119x19 starting at (287, 229).
; PLAN: r0=287(x), r1=229(y), r2=119(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 229
LDI r2, 119
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
