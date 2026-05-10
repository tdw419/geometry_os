; DESCRIPTION: Renders a blue box of size 74x33 starting at (36, 154).
; PLAN: r0=36(x), r1=154(y), r2=74(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 154
LDI r2, 74
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
