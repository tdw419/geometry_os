; DESCRIPTION: Renders a white box of size 96x48 starting at (7, 123).
; PLAN: r0=7(x), r1=123(y), r2=96(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 123
LDI r2, 96
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
