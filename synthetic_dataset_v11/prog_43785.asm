; DESCRIPTION: Renders a white box of size 30x63 starting at (157, 3).
; PLAN: r0=157(x), r1=3(y), r2=30(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 3
LDI r2, 30
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
