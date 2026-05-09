; DESCRIPTION: Renders a white box of size 35x19 starting at (38, 154).
; PLAN: r0=38(x), r1=154(y), r2=35(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 154
LDI r2, 35
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
