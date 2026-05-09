; DESCRIPTION: Renders a white box of size 112x19 starting at (42, 35).
; PLAN: r0=42(x), r1=35(y), r2=112(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 35
LDI r2, 112
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
