; DESCRIPTION: Renders a white box of size 85x60 starting at (280, 87).
; PLAN: r0=280(x), r1=87(y), r2=85(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 87
LDI r2, 85
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
