; DESCRIPTION: Renders a white box of size 87x98 starting at (122, 95).
; PLAN: r0=122(x), r1=95(y), r2=87(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 95
LDI r2, 87
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
