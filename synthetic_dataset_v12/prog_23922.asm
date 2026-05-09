; DESCRIPTION: Renders a white box of size 87x43 starting at (374, 60).
; PLAN: r0=374(x), r1=60(y), r2=87(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 60
LDI r2, 87
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
