; DESCRIPTION: Renders a white box of size 71x91 starting at (9, 154).
; PLAN: r0=9(x), r1=154(y), r2=71(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 154
LDI r2, 71
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
