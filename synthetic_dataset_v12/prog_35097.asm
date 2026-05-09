; DESCRIPTION: Renders a orange box of size 20x99 starting at (193, 154).
; PLAN: r0=193(x), r1=154(y), r2=20(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 154
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
