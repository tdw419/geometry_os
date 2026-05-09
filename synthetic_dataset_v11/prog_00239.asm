; DESCRIPTION: Renders a red box of size 23x92 starting at (65, 154).
; PLAN: r0=65(x), r1=154(y), r2=23(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 154
LDI r2, 23
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
