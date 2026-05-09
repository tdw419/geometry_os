; DESCRIPTION: Renders a white box of size 37x50 starting at (141, 5).
; PLAN: r0=141(x), r1=5(y), r2=37(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 5
LDI r2, 37
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
