; DESCRIPTION: Renders a white box of size 93x98 starting at (325, 60).
; PLAN: r0=325(x), r1=60(y), r2=93(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 60
LDI r2, 93
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
