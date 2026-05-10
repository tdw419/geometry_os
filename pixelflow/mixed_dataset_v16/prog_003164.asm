; DESCRIPTION: Renders a red box of size 88x11 starting at (248, 154).
; PLAN: r0=248(x), r1=154(y), r2=88(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 154
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
