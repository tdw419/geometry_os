; DESCRIPTION: Renders a white box of size 85x60 starting at (263, 11).
; PLAN: r0=263(x), r1=11(y), r2=85(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 11
LDI r2, 85
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
