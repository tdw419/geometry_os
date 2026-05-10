; DESCRIPTION: Renders a white box of size 10x100 starting at (99, 36).
; PLAN: r0=99(x), r1=36(y), r2=10(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 36
LDI r2, 10
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
