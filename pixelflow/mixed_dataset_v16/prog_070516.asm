; DESCRIPTION: Renders a white box of size 114x120 starting at (5, 108).
; PLAN: r0=5(x), r1=108(y), r2=114(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 108
LDI r2, 114
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
