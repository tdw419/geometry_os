; DESCRIPTION: Renders a white box of size 100x77 starting at (123, 50).
; PLAN: r0=123(x), r1=50(y), r2=100(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 50
LDI r2, 100
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
