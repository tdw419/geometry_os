; DESCRIPTION: Renders a orange box of size 56x55 starting at (111, 154).
; PLAN: r0=111(x), r1=154(y), r2=56(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 154
LDI r2, 56
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
