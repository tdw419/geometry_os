; DESCRIPTION: Renders a white box of size 70x100 starting at (103, 7).
; PLAN: r0=103(x), r1=7(y), r2=70(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 7
LDI r2, 70
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
