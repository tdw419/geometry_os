; DESCRIPTION: Renders a white box of size 55x117 starting at (50, 1).
; PLAN: r0=50(x), r1=1(y), r2=55(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 1
LDI r2, 55
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
