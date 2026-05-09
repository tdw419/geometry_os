; DESCRIPTION: Renders a white box of size 50x81 starting at (9, 63).
; PLAN: r0=9(x), r1=63(y), r2=50(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 63
LDI r2, 50
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
